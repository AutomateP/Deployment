using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Diagnostics;
using System.Xml;
using System.Management;
using System.IO;
using System.Configuration;
using System.Web.Configuration;
using System.Text;
using Microsoft.ConfigurationManagement;
using Microsoft.ConfigurationManagement.ManagementProvider;
using Microsoft.ConfigurationManagement.ManagementProvider.WqlQueryEngine;
using Microsoft.ManagementConsole;
using System.DirectoryServices;



namespace Frontend
{
    /// <summary>
    /// Summary description for ConfigMgr
    /// </summary>
    [WebService(Name = "ZTI Frontend", Description = "MDT 2010 Frontend for ConfigMgr 2007 developed by Johan Arwidmark", Namespace = "http://www.deployvista.com")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // [System.Web.Script.Services.ScriptService]
    public class ConfigMgr : System.Web.Services.WebService
    {
        #region Instance variables
        
        String ConfigMgrSiteServer;
        String ConfigMgrSiteCode;
        String MDTDataBaseServer;
        String MDTDatabase;
        String LDAPDomainName;
        String LDAPStartingOU;
        String MDTConnectionString;
        

        #endregion


        #region Constructor
 
        public ConfigMgr()
        {

            // Read the Frontend parameters from web.config
            Trace.WriteLine("ConfigMgr: Read the Frontend parameters from web.config");
            
            Configuration webConfig = WebConfigurationManager.OpenWebConfiguration(null);

            ConfigMgrSiteServer = WebConfigurationManager.AppSettings["ConfigMgrSiteServer"];
            Trace.WriteLine("ConfigMgr: ConfigMgriteServer value from web.config is: " + ConfigMgrSiteServer);
            ConfigMgrSiteCode = WebConfigurationManager.AppSettings["ConfigMgrSiteCode"];
            Trace.WriteLine("ConfigMgr: ConfigMgrSiteCode value from web.config is: " + ConfigMgrSiteCode);
            MDTDataBaseServer = WebConfigurationManager.AppSettings["MDTDataBaseServer"];
            Trace.WriteLine("ConfigMgr: MDTDataBaseServer value from web.config is: " + MDTDataBaseServer);
            MDTDatabase = WebConfigurationManager.AppSettings["MDTDatabase"];
            Trace.WriteLine("ConfigMgr: MDTDatabase value from web.config is: " + MDTDatabase);
            LDAPDomainName = WebConfigurationManager.AppSettings["LDAPDomainName"];
            Trace.WriteLine("ConfigMgr: LDAPDomainName value from web.config is: " + LDAPDomainName);
            LDAPStartingOU = WebConfigurationManager.AppSettings["LDAPStartingOU"];
            Trace.WriteLine("ConfigMgr: LDAPStartingOU value from web.config is: " + LDAPStartingOU);

            // Build the Connection string for the MDT database
            MDTConnectionString = "Network Library=DBNMPNTW;Data Source=" + MDTDataBaseServer + ";Initial Catalog=" + MDTDatabase + ";Integrated Security=SSPI";
            Trace.WriteLine("ConfigMgr: MDTConnectionString is: " + MDTConnectionString);
        }


        #endregion


        #region Web methods


        [WebMethod]
        public string GetOUList()
        {

            Trace.WriteLine("GetOUList: Starting Web Service");
            

            XmlDocument xd = new XmlDocument();

            string OUList = "";
            string LDAPPath = "";
            if (LDAPStartingOU == "")
            {
                Trace.WriteLine("GetOUList: LDAPStartingOU is blank ");
                LDAPPath = "LDAP://" + LDAPDomainName;
            }
            else
            {
                Trace.WriteLine("GetOUList: LDAPStartingOU is set to: " + LDAPStartingOU);
                LDAPPath = "LDAP://" + LDAPStartingOU + "," + LDAPDomainName;
            }

            
            Trace.WriteLine("GetOUList: LDAPPath is: " + LDAPPath);


            try
            {
                DirectoryEntry rootEntry = new
                DirectoryEntry(LDAPPath);

                DirectorySearcher dsFindOUs = new DirectorySearcher(rootEntry);

                dsFindOUs.Filter = "(objectClass=organizationalUnit)";

                dsFindOUs.SearchScope = SearchScope.Subtree;

                dsFindOUs.PropertiesToLoad.Add("Name");

                dsFindOUs.PropertyNamesOnly = true;
                
                dsFindOUs.Sort.Direction = SortDirection.Ascending;

                dsFindOUs.Sort.PropertyName = "Name";

                
                
                // Create a new XmlDocumnt object
                XmlDocument xmlDoc = new XmlDocument();
                
                // Create the root node
                XmlNode root = xmlDoc.CreateElement("xml");
                xmlDoc.AppendChild(root);

                foreach(SearchResult result in dsFindOUs.FindAll() )
                {

                // Create an element "OUListItem"
                XmlElement OUListItem = xmlDoc.CreateElement("OUListItem");

                // Create the Name attribute, and set its value
                XmlAttribute Name = xmlDoc.CreateAttribute("Name");
                Name.Value = result.GetDirectoryEntry().Properties["Name"].Value.ToString();

                // Add the attribute to the element
                OUListItem.Attributes.Append(Name);

                // Create the distinguishedName attribute, and set its value
                XmlAttribute distinguishedName = xmlDoc.CreateAttribute("distinguishedName");
                distinguishedName.Value = result.GetDirectoryEntry().Properties["distinguishedName"].Value.ToString();

                // Add the attribute to the element
                OUListItem.Attributes.Append(distinguishedName);

                // Add "OUListItem" to root
                root.AppendChild(OUListItem);

                }

                Trace.WriteLine("GetOUList: Active Directory OU List is " + OUList);
                return xmlDoc.InnerXml;

            }
            catch (Exception e)
            {
                Trace.WriteLine("GetOUList: Unhandled exception finding provider namespace on server " + e.ToString());
                return "GetOUList: Connection could not be made to Active Directory";
                
            }

        }


        [WebMethod]
        public String GetTaskSequenceList()
        {

            Trace.WriteLine("GetTaskSequenceList: Starting Web Service");
            
            string sTSList = "";

            // Connect to Database Server
            ManagementScope scope = new ManagementScope("\\\\" + ConfigMgrSiteServer + "\\root\\sms\\site_" + ConfigMgrSiteCode);

            try
            {
                // Connect to the ConfigMgr Site Server

                Trace.WriteLine("GetTaskSequenceList: Connecting to " + ConfigMgrSiteServer);
                scope.Connect();

                String strSQL = "";
                strSQL = "SELECT CollectionID,Name,Comment FROM SMS_Collection ";
                strSQL = strSQL + "WHERE CollectionID IN(SELECT CollectionID From SMS_Advertisement ";
                strSQL = strSQL + "WHERE PackageID IN(SELECT PackageID From SMS_TaskSequencePackage Where Type = 2)) ";

                Trace.WriteLine("GetTaskSequenceList: SQL String is: " + strSQL);
                ObjectQuery query = new ObjectQuery(strSQL);

                
                ManagementObjectSearcher searcher = new ManagementObjectSearcher(scope, query);
                ManagementObjectCollection queryCollection = searcher.Get();


                // Create a new XmlDocumnt object
                XmlDocument xmlDoc = new XmlDocument();

                // Create the root node
                XmlNode root = xmlDoc.CreateElement("xml");
                xmlDoc.AppendChild(root);
                
                


                foreach (ManagementObject m in queryCollection)
                {
                    // Display the information

                    if (m["Name"].ToString() == "All Systems")
                    {
                        // Do Nothing
                    }
                    else if (m["Name"].ToString() == "All Unknown Computers")
                    {
                        // Do Nothing
                    }
                    else
                    {

                        // Create an element "TSListItem"
                        XmlElement TSListItem = xmlDoc.CreateElement("TSListItem");

                        // Create the "CollectionID" attribute, and set its value
                        XmlAttribute CollectionID = xmlDoc.CreateAttribute("CollectionID");
                        CollectionID.Value = m["CollectionID"].ToString();

                        // Add the "CollectionID" attribute to the element
                        TSListItem.Attributes.Append(CollectionID);

                        // Create the "Name" attribute, and set its value
                        XmlAttribute Name = xmlDoc.CreateAttribute("Name");
                        Name.Value = m["Name"].ToString();

                        // Add the "Name" attribute to the element
                        TSListItem.Attributes.Append(Name);

                        // Add "TSListItem" to root
                        root.AppendChild(TSListItem);
                                                
                    }
                }

                Trace.WriteLine("GetTaskSequenceList: Task Sequence name is " + sTSList);
                return xmlDoc.InnerXml;

            }
            catch (Exception e)
            {
                Trace.WriteLine("GetTaskSequenceList: Unhandled exception finding provider namespace on server " + e.ToString());
                return "GetTaskSequenceList: Connection could not be made to the ConfigMgr Site Server";
            }

        }

        [WebMethod]
        public String GetRoleList()
        {

            Trace.WriteLine("GetRoleList: Starting Web Service");

            // Connect to Database Server
            
            try
			{
                SqlConnection conn = new SqlConnection(MDTConnectionString);

				conn.Open();
		 	    SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT Role FROM RoleIdentity";
                Trace.WriteLine("GetRoleList: SQL String is: " + cmd.CommandText);
			    SqlDataReader thisReader = cmd.ExecuteReader();

                // Create a new XmlDocumnt object
                XmlDocument xmlDoc = new XmlDocument();

                // Create the root node
                XmlNode root = xmlDoc.CreateElement("xml");
                xmlDoc.AppendChild(root);


				while (thisReader.Read())
				{

                // Create an element "RoleListItem"
                XmlElement RoleListItem = xmlDoc.CreateElement("RoleListItem");

                // Create the "Role" attribute, and set its value
                XmlAttribute Role = xmlDoc.CreateAttribute("Role");
                Role.Value = thisReader["Role"].ToString();

                // Add the "Role" attribute to the element
                RoleListItem.Attributes.Append(Role);

                // Add "RoleListItem" to root
                root.AppendChild(RoleListItem);

		 		}
				thisReader.Close();
				conn.Close();

                return xmlDoc.InnerXml;

			}
			catch (SqlException e)
			{
                Trace.WriteLine("GetRoleList: Unhandled exception finding provider namespace on server " + e.ToString());
                return "GetRoleList: Connection could not be made to the MDT Database";
            }

            
            

        }



        [WebMethod]
        public Boolean IsComputerKnown(String macAddress, String smbiosGuid)
        {

            Trace.WriteLine("IsComputerKnown: Starting Web Service");

            // Connect to ConfigMgr Site Server
            ManagementScope scope = new ManagementScope("\\\\" + ConfigMgrSiteServer + "\\root\\sms\\site_" + ConfigMgrSiteCode);

            try
            {
                Trace.WriteLine("Connecting to: " + ConfigMgrSiteServer);
                scope.Connect();

                // Get the computer info

                String resourceID = "";

                String strSQL = "SELECT * FROM SMS_R_System WHERE MacAddresses = '" + macAddress + "'";
                if (smbiosGuid != "")
                    strSQL += " or SMBIOSGUID = '" + smbiosGuid + "'";

                Trace.WriteLine("IsComputerKnown: Looking for computer...");
                Trace.WriteLine("IsComputerKnown: SQL String is: " + strSQL);
                ObjectQuery computerQuery = new ObjectQuery(strSQL);
                ManagementObjectSearcher siteSearcher = new ManagementObjectSearcher(scope, computerQuery);

                ManagementObjectCollection siteCollection = siteSearcher.Get();
                foreach (ManagementObject s in siteCollection)
                {
                    resourceID = s["ResourceID"].ToString();
                    Trace.WriteLine("IsComputerKnown: Resource ID of computer is known, ID = " + resourceID);
                }


                // Return the answer

                if (resourceID == "")
                {
                    Trace.WriteLine("IsComputerKnown: Resource ID of the computer is not known or could not be determined");
                    return false;
                }
                else
                    return true;
            }
            catch (Exception e)
            {
                Trace.WriteLine("IsComputerKnown: Unhandled exception occurred.  " + e.ToString());
            }

            return false;

        }


        [WebMethod]
        public String GetComputerName(String MacAddress)
        {

            Trace.WriteLine("GetComputerName: Starting Web Service");
            string sGetComputerName = "";

            // Connect to Database Server

            try
            {

                SqlConnection conn = new SqlConnection(MDTConnectionString);

                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select OSDComputerName, ComputerName from ComputerSettings WHERE MacAddress = '" + MacAddress + "'";
                Trace.WriteLine("GetComputerName: SQL string is: " + cmd.CommandText);
                SqlDataReader thisReader = cmd.ExecuteReader();
                while (thisReader.Read())
                {

                    sGetComputerName = thisReader["OSDComputername"].ToString();

                    if (sGetComputerName == "")
                    {
                        sGetComputerName = thisReader["Computername"].ToString();
                        
                    }


                }
                thisReader.Close();
                conn.Close();

            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }

            if (sGetComputerName == "")
            {
                Trace.WriteLine("GetComputerName: No Record in database, computername could not be found ");
                return sGetComputerName;
            }
            else
            {
                Trace.WriteLine("GetComputerName: Computername is:  " + sGetComputerName);
                return sGetComputerName;
            }
        }

        [WebMethod]
        public String GetComputerDescription(String MacAddress)
        {

            Trace.WriteLine("GetComputerDescription: Starting Web Service");
            string sGetComputerDescription = "";

            // Connect to Database Server

            try
            {

                SqlConnection conn = new SqlConnection(MDTConnectionString);

                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select Description from ComputerIdentity WHERE MacAddress = '" + MacAddress + "'";
                Trace.WriteLine("GetComputerDescription: SQL string is: " + cmd.CommandText);
                SqlDataReader thisReader = cmd.ExecuteReader();
                while (thisReader.Read())
                {

                    sGetComputerDescription = thisReader["Description"].ToString();

                }
                thisReader.Close();
                conn.Close();

            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }

            if (sGetComputerDescription == "")
            {
                Trace.WriteLine("GetComputerDescription: No Record in database, Description could not be found ");
                return sGetComputerDescription;
            }
            else
            {
                Trace.WriteLine("GetComputerDescription: Description is:  " + sGetComputerDescription);
                return sGetComputerDescription;
            }
        }

        
        [WebMethod]
        public String GetComputerRole(String MacAddress)
        {

            Trace.WriteLine("GetComputerRole: Starting Web Service");
            string sGetComputerRole = "";

            // Connect to Database Server

            try
            {

                SqlConnection conn = new SqlConnection(MDTConnectionString);

                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select Role from ComputerRoles WHERE MacAddress = '" + MacAddress + "'";
                Trace.WriteLine("GetComputerRole: SQL String is: " + cmd.CommandText);
                SqlDataReader thisReader = cmd.ExecuteReader();
                while (thisReader.Read())
                {

                    // Display the information
                    sGetComputerRole = sGetComputerRole + thisReader["Role"].ToString();
                    
                }
                thisReader.Close();
                conn.Close();

            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }

            if (sGetComputerRole == "")
            {
                Trace.WriteLine("GetComputerRole: No Record in database, role could not be found ");
                return sGetComputerRole;
            }
            else
            {
                Trace.WriteLine("GetComputerRole: Role is: " + sGetComputerRole);
                return sGetComputerRole;
            }


        }


        [WebMethod]
        public Boolean UpdateComputer(String OSDComputerName, String ComputerDescription, String MacAddress, String MachineObjectOU, string Role)
        {

            Trace.WriteLine("UpdateComputer: Starting Web Service");

            Trace.WriteLine("OSDComputerName input parameter is: " + OSDComputerName);
            Trace.WriteLine("ComputerDescription input parameter is: " + ComputerDescription);
            Trace.WriteLine("MacAddress input parameter is: " + MacAddress);
            Trace.WriteLine("MachineObjectOU input parameter is: " + MachineObjectOU);
            Trace.WriteLine("Role input parameter is: " + Role);

            try
            {

                SqlConnection conn = new SqlConnection(MDTConnectionString);
                conn.Open();

                // Check if the Computer exists

                String sGetComputerName = "";
                String sID = "";
                string strSQL = "";


                strSQL = "Select ComputerIdentity.Description, ComputerIdentity.ID, Settings.OSDComputerName ";
                strSQL = strSQL + "from ComputerIdentity Inner Join Settings ";
                strSQL = strSQL + "on ComputerIdentity.ID = Settings.ID ";
                strSQL = strSQL + "WHERE Settings.Type = 'C' AND MacAddress = '" + MacAddress + "' "; 

                
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = strSQL;

                Trace.WriteLine("UpdateComputer: SQL String is: " + cmd.CommandText);
                SqlDataReader thisReader = cmd.ExecuteReader();
                while (thisReader.Read())
                {

                    sGetComputerName = thisReader["OSDComputername"].ToString();
                    sID = thisReader["ID"].ToString();
                    Trace.WriteLine("UpdateComputer: OSDComputerName is " + sGetComputerName);
                    Trace.WriteLine("UpdateComputer: ID is " + sID);

                }
                thisReader.Close();

                if (sGetComputerName == "")
                {
                    // This computer is not in the MDT database, creating new record...
                    Trace.WriteLine("This computer is not in the MDT database, creating new record...");
             
                    // Insert into the ComputerIdentity table
                    strSQL = "insert into ComputerIdentity(Description, MacAddress) values (@ComputerDescription, @MacAddress);Select Scope_Identity()";
                    Trace.WriteLine("UpdateComputer: strSQL is: " + strSQL);

                    SqlCommand cmdIns = new SqlCommand(strSQL, conn);
                    cmdIns.Parameters.AddWithValue("@ComputerDescription", ComputerDescription);
                    cmdIns.Parameters.AddWithValue("@MacAddress", MacAddress);

                    cmdIns.ExecuteNonQuery();

                    cmdIns.Parameters.Clear();
                    cmdIns.CommandText = "SELECT @@IDENTITY";

                    // Get the last inserted id.
                    int insertID = Convert.ToInt32(cmdIns.ExecuteScalar());
                    Trace.WriteLine("UpdateComputer: New ID is: " + insertID);

                    cmdIns.Dispose();
                    cmdIns = null;



                    // Add Computer Settings
                    Trace.WriteLine("UpdateComputer: Add Computer Settings");

                    string strSQL2 = "insert into Settings(Type, ID, OSDComputerName, MachineObjectOU) values (@Type, @ID, @OSDComputerName, @MachineObjectOU)";
                    Trace.WriteLine("UpdateComputer: SQL string is: " + strSQL2);

                    SqlCommand cmdIns2 = new SqlCommand(strSQL2, conn);
                    cmdIns2.Parameters.AddWithValue("@Type", "C");
                    cmdIns2.Parameters.AddWithValue("@ID", insertID);
                    cmdIns2.Parameters.AddWithValue("@OSDComputerName", OSDComputerName);
                    cmdIns2.Parameters.AddWithValue("@MachineObjectOU", MachineObjectOU);

                    cmdIns2.ExecuteNonQuery();

                    cmdIns2.Dispose();
                    cmdIns2 = null;

                    // Add the Computer Role
                    Trace.WriteLine("UpdateComputer: Add Computer Role");

                    string strSQL3 = "insert into Settings_Roles(Type, ID, Sequence, Role) values (@Type, @ID, @Sequence, @Role)";
                    Trace.WriteLine("UpdateComputer: SQL string is: " + strSQL3);

                    SqlCommand cmdIns3 = new SqlCommand(strSQL3, conn);
                    cmdIns3.Parameters.AddWithValue("@Type", "C");
                    cmdIns3.Parameters.AddWithValue("@ID", insertID);
                    cmdIns3.Parameters.AddWithValue("@Sequence", "1");
                    cmdIns3.Parameters.AddWithValue("@Role", Role);

                    cmdIns3.ExecuteNonQuery();

                    cmdIns3.Dispose();
                    cmdIns3 = null;
                }
                else
                {
                    // This computer is already in the MDT database, updating existing computer record
                    Trace.WriteLine("UpdateComputer: This computer is already in the MDT database, updating existing computer record");

                    strSQL = "Update ComputerIdentity SET Description = @Description, MacAddress = @MacAddress WHERE ID = " + sID + " ";
                    Trace.WriteLine("UpdateComputer: SQL string is: " + strSQL);

                    SqlCommand cmdUpdate = new SqlCommand(strSQL, conn);
                    cmdUpdate.Parameters.AddWithValue("@Description", ComputerDescription);
                    cmdUpdate.Parameters.AddWithValue("@MacAddress", MacAddress);
                    

                    cmdUpdate.ExecuteNonQuery();

                    cmdUpdate.Dispose();
                    cmdUpdate = null;

                    // Update Computer Settings

                    Trace.WriteLine("UpdateComputer: Update Computer Settings");

                    string strSQL2 = "Update Settings SET OSDComputerName = @OSDComputerName, MachineObjectOU = @MachineObjectOU WHERE ID = " + sID + " AND Type = 'C' ";
                    Trace.WriteLine("UpdateComputer: SQL string is: " + strSQL2);

                    SqlCommand cmdUpdate2 = new SqlCommand(strSQL2, conn);
                    cmdUpdate2.Parameters.AddWithValue("@OSDComputerName", OSDComputerName);
                    cmdUpdate2.Parameters.AddWithValue("@MachineObjectOU", MachineObjectOU);

                    cmdUpdate2.ExecuteNonQuery();

                    cmdUpdate2.Dispose();
                    cmdUpdate2 = null;

                    // Update the Computer Role

                    Trace.WriteLine("UpdateComputer: Update the Computer Role");

                    string strSQL3 = "Update Settings_Roles SET Type = @Type, Sequence = @Sequence, Role = @Role WHERE ID = " + sID + " ";
                    Trace.WriteLine("UpdateComputer: SQL string is: " + strSQL3);

                    SqlCommand cmdUpdate3 = new SqlCommand(strSQL3, conn);
                    cmdUpdate3.Parameters.AddWithValue("@Type", "C");
                    cmdUpdate3.Parameters.AddWithValue("@ID", sID);
                    cmdUpdate3.Parameters.AddWithValue("@Sequence", "1");
                    cmdUpdate3.Parameters.AddWithValue("@Role", Role);

                    cmdUpdate3.ExecuteNonQuery();

                    cmdUpdate3.Dispose();
                    cmdUpdate3 = null;


                }

                    conn.Close();
            
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }

            return true;

        }

        

        [WebMethod]
        public Boolean AddComputerToCollection(String OSDComputerName, String macAddress, String smbiosGuid, String collectionID)
        {
            Trace.WriteLine("AddComputerToCollection: Starting Web Service");
            
            String resourceID;
            

            // Connect to ConfigMgr Site Server
            ManagementScope scope = new ManagementScope("\\\\" + ConfigMgrSiteServer + "\\root\\sms\\site_" + ConfigMgrSiteCode);

            try
            {
                Trace.WriteLine("AddComputerToCollection: Connecting to: " + ConfigMgrSiteServer);
                scope.Connect();

         
            if (scope == null)
            {
                Trace.WriteLine("AddComputerToCollection: Unable to connect to the site.");
                return false;
            }


            // Import the new machine

            Trace.WriteLine("AddComputerToCollection: Invoking ImportMachineEntry method");

                ManagementClass siteClass = new ManagementClass(scope, new ManagementPath("SMS_Site"), new ObjectGetOptions());

                ManagementBaseObject inParams = siteClass.GetMethodParameters("ImportMachineEntry");
                if (OSDComputerName == "")
                    inParams["NetbiosName"] = macAddress.Replace(":", "");
                else
                    inParams["NetbiosName"] = OSDComputerName;
                inParams["SMBIOSGUID"] = smbiosGuid;
                inParams["MACAddress"] = macAddress;
                inParams["OverwriteExistingRecord"] = false;

                ManagementBaseObject outParams = siteClass.InvokeMethod("ImportMachineEntry", inParams, new InvokeMethodOptions());
                resourceID = outParams["ResourceID"].ToString();
                Trace.WriteLine("AddComputerToCollection: Successfully added new computer " + inParams["NetbiosName"].ToString() + " with resource ID " + resourceID);
            }
            catch (Exception e)
            {
                Trace.WriteLine("AddComputerToCollection: Unhandled exception adding new computer.  " + e.ToString());
                return false;
            }


            // Need to add to a collection?  If so, do it.

            if (collectionID != "")
            {
                try
                {
                    // Get the collection instance

                    Trace.WriteLine("AddComputerToCollection: Adding the computer to collection " + collectionID);
                    ManagementObject collectionInstance = new ManagementObject(scope, new ManagementPath("SMS_Collection.CollectionID='" + collectionID + "'"), new ObjectGetOptions());


                    // Create a new collection rule

                    ManagementClass ruleClass = new ManagementClass(scope, new ManagementPath("SMS_CollectionRuleDirect"), new ObjectGetOptions());
                    ManagementObject newRule = ruleClass.CreateInstance();
                    newRule["ResourceClassName"] = "SMS_R_System";
                    newRule["ResourceID"] = resourceID;
                    if (OSDComputerName == "")
                        newRule["RuleName"] = macAddress.Replace(":", "");
                    else
                        newRule["RuleName"] = OSDComputerName;

                    // Add the rule
                    collectionInstance.InvokeMethod("AddMembershipRule", new object[] { newRule });
                    Trace.WriteLine("AddComputerToCollection: Successfully added new membership rule to collection " + collectionID);
                }
                catch (Exception e)
                {
                    Trace.WriteLine("AddComputerToCollection: Failed to collection rule.  " + e.ToString());
                }
            }

            return true;

        }


        [WebMethod]
        public Boolean HasAdvertisement(String macAddress, String smbiosGuid)
        {

            Trace.WriteLine("HasAdvertisement: Starting Web Service");

            // Connect to ConfigMgr Site Server
            ManagementScope scope = new ManagementScope("\\\\" + ConfigMgrSiteServer + "\\root\\sms\\site_" + ConfigMgrSiteCode);

            try
            {
                Trace.WriteLine("HasAdvertisement: Connecting to: " + ConfigMgrSiteServer);
                scope.Connect();

         
            if (scope == null)
            {
                Trace.WriteLine("HasAdvertisement: Unable to connect to the site.");
                return false;
            }

                // Get the computer info

                String resourceID = "";

                String strSQL = "SELECT * FROM SMS_R_System WHERE MacAddresses = '" + macAddress + "'";
                if (smbiosGuid != "")
                    strSQL += " or SMBIOSGUID = '" + smbiosGuid + "'";

                Trace.WriteLine("HasAdvertisement: Looking for computer...");
                Trace.WriteLine("HasAdvertisement: SQL string is: " + strSQL);
                ObjectQuery computerQuery = new ObjectQuery(strSQL);
                ManagementObjectSearcher siteSearcher = new ManagementObjectSearcher(scope, computerQuery);

                ManagementObjectCollection siteCollection = siteSearcher.Get();
                foreach (ManagementObject s in siteCollection)
                {
                    resourceID = s["ResourceID"].ToString();
                    Trace.WriteLine("HasAdvertisement: Resource ID of computer is known, ID = " + resourceID);
                }
                if (resourceID == "")
                {
                    Trace.WriteLine("HasAdvertisement: Computer not found in the database, unable to continue.");
                    return false;
                }


                // Look for an advertisement

                ManagementClass advertisementClass = new ManagementClass(scope, new ManagementPath("SMS_Advertisement"), new ObjectGetOptions());
                ManagementBaseObject inParams = advertisementClass.GetMethodParameters("GetAdvertisements");
                inParams["ResourceID"] = resourceID;
                Trace.WriteLine("HasAdvertisement: Requesting list of advertisements by calling GetAdvertisements for resource ID " + resourceID);
                ManagementBaseObject outParams = advertisementClass.InvokeMethod("GetAdvertisements", inParams, new InvokeMethodOptions());

                String[] adverts = (String[])outParams["AdvertisementIDs"];
                if (adverts.GetLength(0) > 0)
                {
                    Trace.WriteLine("HasAdvertisement: Found at least one advertisement, returning true.");
                    return true;
                }
                else
                {
                    Trace.WriteLine("HasAdvertisement: No advertisements found, returning false.");
                    return false;
                }

            }
            catch (Exception e)
            {
                Trace.WriteLine("HasAdvertisement: Unhandled exception occurred.  " + e.ToString());
            }

            return false;

        }

        [WebMethod]
        public Boolean DeleteComputerInConfigMgr(String macAddress, String smbiosGuid)
        {

            Trace.WriteLine("DeleteComputerInConfigMgr: Starting Web Service");
            Trace.WriteLine("Mac Address is : " + macAddress);
            Trace.WriteLine("smbiosGuid is: " + smbiosGuid);


            // Connect to ConfigMgr Site Server
            ManagementScope scope = new ManagementScope("\\\\" + ConfigMgrSiteServer + "\\root\\sms\\site_" + ConfigMgrSiteCode);

            try
            {
                Trace.WriteLine("DeleteComputerInConfigMgr: Connecting to: " + ConfigMgrSiteServer);
                scope.Connect();

                // Get the computer info

                String resourceID = "";

                String strSQL = "SELECT * FROM SMS_R_System WHERE MacAddresses = '" + macAddress + "'";
                if (smbiosGuid != "")
                    strSQL += " or SMBIOSGUID = '" + smbiosGuid + "'";

                Trace.WriteLine("DeleteComputerInConfigMgr: Looking for computer...");
                Trace.WriteLine("DeleteComputerInConfigMgr: SQL string is: " + strSQL);

                ObjectQuery computerQuery = new ObjectQuery(strSQL);
                ManagementObjectSearcher siteSearcher = new ManagementObjectSearcher(scope, computerQuery);

                ManagementObjectCollection siteCollection = siteSearcher.Get();
                foreach (ManagementObject s in siteCollection)
                {
                    // Display message and delete the object.
                    resourceID = s["ResourceID"].ToString();
                    Trace.WriteLine("DeleteComputer: Deleting Resource ID " + resourceID);
                    s.Delete();
                }

                // Return the answer
                return true;

            }
            catch (Exception e)
            {
                Trace.WriteLine("DeleteComputer: Unhandled exception occurred.  " + e.ToString());
                return false;
            }


        }




        #endregion
    }
}
