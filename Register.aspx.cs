using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                        ddlCountries.Items.Insert(0, new ListItem("Select Country", ""));
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
                        cmd.Parameters.AddWithValue ("@state_id", state_id);
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
    }
}