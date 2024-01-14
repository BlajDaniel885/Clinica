using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;
using System.Web.Http;

namespace Clinica.Controllers
{
    public class HomeController : Controller
    {
        private readonly IConfiguration configuration;
        
        public HomeController(IConfiguration config)
        {
            this.configuration = config;
        }
        public IActionResult Index()
        {
           /* string connectionString = configuration.GetConnectionString("DefaultConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();
            SqlCommand com = new SqlCommand("Select count(*) from Useri", connection);
            var count = (int)com.ExecuteScalar();
            
            ViewData["TotalData"] = count;

            connection.Close();
            */return View("Index");
        }
    }
}
