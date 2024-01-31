using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;

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
            string connectionString = configuration.GetConnectionString("SqlServerConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();
            SqlCommand com = new SqlCommand("Select count(*) from Useri", connection);
            var count = (int)com.ExecuteScalar();
            
            ViewData["TotalData"] = count;

            connection.Close();
            return View("Index");
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Authenticate(string txtUserName, string txtPassword)
        {
            // TODO: if (UserAndPasswordMatches(username, password) != null)

            if((txtUserName.ToLower()=="admin") && (txtPassword == "123"))
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, txtUserName)
                };
                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var principal = new ClaimsPrincipal(identity);
                var props = new AuthenticationProperties();
                HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, props).Wait();
                return RedirectToAction("Index", "Employee");
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index");
        }

        // TODO: declarare UserAndPasswordMatches()
        // returneaza userul impreuna cu rolurile sale
        // TODO:trebuie facut prima data apel catre tabelul de user si verificat username si parola 
        // TODO:apoi trebuie facut apel catre tabela inter-user-rol si tabela rol ca sa aduci rolurile utilizatorului ca string aka "admin"/ "doctor"/ "pacient" (nu id : 1,2,3)
        // TODO:hint: iti trebuie un ViewModel (adica o clasa noua) care sa contina tot ce contine clasa de user si in plus va avea si o lista de string-uri pt roluri.    
        // TODO:clasa de LoginViewModel sau UserViewModel sau LoginVM prescurtat, trebuie pusa intr-un Folder separat numit ViewModels, la fel ca Views, Controllers, Properties.
        // TODO: sterge rolId din tabela user
        // TODO:Muta tot ce tine de login, auth in controllerul de Account

        // TODO:Authorizare pe baza de cookies
        // Cookie Authorization - pe google
    }
}
