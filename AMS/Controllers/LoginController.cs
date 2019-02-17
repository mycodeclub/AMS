using AMS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
namespace AMS.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "UserName,Password,RememberMe")] Login login)
        {
            AmsDbContext db = new AmsDbContext();
            var users = db.Logins.ToList();
            var user = db.Logins.Where(l => l.UserName == login.UserName && l.Password == login.Password).FirstOrDefault();
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(login.loginId.ToString(), false);
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Dashboard");
            }
            else { ModelState.AddModelError("Password", "Invalid User Name or Password"); }
            return View(login);
        }

        public ActionResult forgotpassword()
        {
            return View();
        }
    }
}