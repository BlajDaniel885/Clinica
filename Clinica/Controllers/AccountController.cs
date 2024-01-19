using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Clinica.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        public IActionResult Login()
        {
            return View("Login");
        }

    }
}
