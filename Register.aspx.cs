using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Employee_Registration
{
    public partial class Register : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["AmrutDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountries();
                BindJobType();
                BindEmployeeType();
                BindGender();
                BindGridView();
            }
        }

        private void BindCountries()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetCountry_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);

                        ddlCountries.DataSource = dt;
                        ddlCountries.DataTextField = "country_name"; // Column name for display text
                        ddlCountries.DataValueField = "country_id";  // Column name for value
                        ddlCountries.DataBind();

                        // Optionally add a default item
                        ddlCountries.Items.Insert(0, new ListItem("Select Country", "0"));
                        ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
                        ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void BindStates(int country_id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetState_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@country_id", country_id);
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);

                        ddlStates.DataSource = dt;
                        ddlStates.DataTextField = "state_name";
                        ddlStates.DataValueField = "state_id";
                        ddlStates.DataBind();

                        // Optionally add a default item
                        ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void BindCities(int state_id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetCity_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@state_id", state_id);
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);

                        ddlCities.DataSource = dt;
                        ddlCities.DataTextField = "city_name";
                        ddlCities.DataValueField = "city_id";
                        ddlCities.DataBind();

                        // Optionally add a default item
                        ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void BindJobType()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetJobType_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);

                        ddlJobType.DataSource = dt;
                        ddlJobType.DataTextField = "lookup_name";
                        ddlJobType.DataValueField = "lookup_id";
                        ddlJobType.DataBind();

                        // Optionally add a default item
                        ddlJobType.Items.Insert(0, new ListItem("Select Job Type", ""));
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void BindEmployeeType()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetEmployeeType_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);

                        ddlEmployeeType.DataSource = dt;
                        ddlEmployeeType.DataTextField = "lookup_name";
                        ddlEmployeeType.DataValueField = "lookup_id";
                        ddlEmployeeType.DataBind();

                        // Optionally add a default item
                        ddlEmployeeType.Items.Insert(0, new ListItem("Select Employee Type", ""));
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void BindGender()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetGender_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);

                        rblGender.DataSource = dt;
                        rblGender.DataTextField = "lookup_name";
                        rblGender.DataValueField = "lookup_id";
                        rblGender.DataBind();

                        // Optionally add a default item
                        //rblGender.Items.Insert(0, new ListItem("Select Job Type", ""));
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetEmployeeDetails_Amrut", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        SqlDataAdapter ds = new SqlDataAdapter(cmd);
                        DataSet dt = new DataSet();
                        ds.Fill(dt);

                        EmployeeDetails.DataSource = dt.Tables[0];
                        EmployeeDetails.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    // Log the detailed error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlCountries.SelectedIndex != 0)
                {
                    int country_id = int.Parse(ddlCountries.SelectedValue);
                    BindStates(country_id);
                }
                else
                {
                    BindStates(0);
                    BindCities(0);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
        protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlStates.SelectedIndex != 0)
                {
                    int state_id = int.Parse(ddlStates.SelectedValue);
                    BindCities(state_id);
                }
                else
                {
                    BindCities(0);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void ClearForm()
        {
            hfEmpId.Value = string.Empty;
            tbName.Text = string.Empty;
            tbEmail.Text = string.Empty;
            tbDOB.Text = string.Empty;
            tbMobile.Text = null;
            rblGender.ClearSelection();
            ddlCountries.SelectedIndex = 0;
            ddlStates.Items.Clear();
            ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
            ddlCities.Items.Clear();
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
            tbAddress.Text = string.Empty;
            tbPincode.Text = string.Empty;
            ddlEmployeeType.SelectedIndex = 0;
            ddlJobType.SelectedIndex = 0;

            // Hide the Submit button and show the Update button
            btnSubmit.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void PopulateForm(int emp_id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SP_GetEmployeeById_Amrut", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emp_id", emp_id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Populate form fields with data from the database
                                hfEmpId.Value = reader["emp_id"].ToString();
                                tbName.Text = reader["emp_name"].ToString();
                                tbEmail.Text = reader["emp_email"].ToString();
                                tbDOB.Text = Convert.ToDateTime(reader["dob"]).ToString("yyyy-MM-dd");
                                tbMobile.Text = reader["emp_mobile"].ToString();
                                rblGender.SelectedValue = reader["gender"].ToString();
                                ddlCountries.SelectedValue = reader["country"].ToString();
                                BindStates(Convert.ToInt32(reader["country"]));
                                ddlStates.SelectedValue = reader["state"].ToString();
                                BindCities(Convert.ToInt32(reader["state"]));
                                ddlCities.SelectedValue = reader["city"].ToString();
                                tbAddress.Text = reader["address"].ToString();
                                tbPincode.Text = reader["pincode"].ToString();
                                ddlEmployeeType.SelectedValue = reader["emp_type"].ToString();
                                ddlJobType.SelectedValue = reader["job_type"].ToString();

                                // Hide the Submit button and show the Update button
                                btnSubmit.Visible = false;
                                btnUpdate.Visible = true;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the error
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }
        private void DeactivateEmployee(int emp_id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_DeleteEmployee_Amrut", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emp_id", emp_id);
                        cmd.Parameters.AddWithValue("@is_active", 0);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        BindGridView();
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = tbName.Text;
            string email = tbEmail.Text;
            string dob = tbDOB.Text;
            string mobile = tbMobile.Text;
            string gender = rblGender.Text;
            int country = int.Parse(ddlCountries.SelectedValue);
            int state = int.Parse(ddlStates.SelectedValue);
            int city = int.Parse(ddlCities.SelectedValue);
            string address = tbAddress.Text;
            string pincode = tbPincode.Text;
            int emp_type = int.Parse(ddlEmployeeType.SelectedValue);
            int job_type = int.Parse(ddlJobType.SelectedValue);

            // Connection string to your database
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_SaveEmployee_Amrut", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emp_name", name);
                        cmd.Parameters.AddWithValue("@emp_email", email);
                        cmd.Parameters.AddWithValue("@emp_mobile", mobile);
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@emp_type", emp_type);
                        cmd.Parameters.AddWithValue("@job_type", job_type);
                        cmd.Parameters.AddWithValue("@address", address);
                        cmd.Parameters.AddWithValue("@country", country);
                        cmd.Parameters.AddWithValue("@state", state);
                        cmd.Parameters.AddWithValue("@city", city);
                        cmd.Parameters.AddWithValue("@pincode", pincode);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        BindGridView();
                        ClearForm();
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int emp_id = int.Parse(hfEmpId.Value);
            string name = tbName.Text;
            string email = tbEmail.Text;
            string dob = tbDOB.Text;
            string mobile = tbMobile.Text;
            string gender = rblGender.Text;
            int country = int.Parse(ddlCountries.SelectedValue);
            int state = int.Parse(ddlStates.SelectedValue);
            int city = int.Parse(ddlCities.SelectedValue);
            string address = tbAddress.Text;
            string pincode = tbPincode.Text;
            int emp_type = int.Parse(ddlEmployeeType.SelectedValue);
            int job_type = int.Parse(ddlJobType.SelectedValue);

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_UpdateEmployeeById_Amrut", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emp_id", emp_id);
                        cmd.Parameters.AddWithValue("@emp_name", name);
                        cmd.Parameters.AddWithValue("@emp_email", email);
                        cmd.Parameters.AddWithValue("@emp_mobile", mobile);
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@emp_type", emp_type);
                        cmd.Parameters.AddWithValue("@job_type", job_type);
                        cmd.Parameters.AddWithValue("@address", address);
                        cmd.Parameters.AddWithValue("@country", country);
                        cmd.Parameters.AddWithValue("@state", state);
                        cmd.Parameters.AddWithValue("@city", city);
                        cmd.Parameters.AddWithValue("@pincode", pincode);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        BindGridView();
                        ClearForm();

                        // Switch back the buttons
                        btnSubmit.Visible = true;
                        btnUpdate.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }
        protected void EmployeeDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    int emp_id = Convert.ToInt32(e.CommandArgument);
                    if (e.CommandName == "EditEmployee")
                    {
                        PopulateForm(emp_id);
                    }
                    else if (e.CommandName == "DeleteEmployee")
                    {
                        DeactivateEmployee(emp_id);
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                BindGridView();
            }
        }
    }
}