using MVC_Muzik_Magaza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace MVC_Muzik_Magaza.Controllers
{
    public class KullaniciAnasayfaController : Controller
    {
        private mmagazaEntities db=new mmagazaEntities();
        // GET: KullaniciAnasayfa
        public ActionResult Index()
        {

            //IEnumerable<MVC_Muzik_Magaza.Models.tbl_kategori> kategoriler = db.tbl_kategori;








            return View();


        }







        public ActionResult Satısyap() 
        {

            return View();




        }

        [HttpPost]
        public ActionResult Satısyap(int id)
        {
            if (!string.IsNullOrEmpty(Session["KullaniciAdi"] as string))
            {
                int Musteriid = Convert.ToInt32(Session["KullaniciID"]);
                var urun = db.tbl_urun.FirstOrDefault(u => u.UrunID == id);

                if (urun != null)
                {
                    var satis = new tbl_satis
                    {
                        Musteri = Musteriid,
                        Urun = urun.UrunID,
                        SatisFiyat = urun.UrunFiyat, // Satış fiyatını ürünün fiyatı olarak belirleyebilirsiniz
                        Satistarih = DateTime.Now,
                        Satisadet=1
                        
                    };

                    db.tbl_satis.Add(satis);
                    db.SaveChanges();
                }

                return RedirectToAction("satisbasarili", "KullaniciAnasayfa");
            }
            else
            {
                return RedirectToAction("Girisyap", "Uyelik");
            }
        }



        public ActionResult satisbasarili(tbl_satis p1)
        {
            int deneme = Convert.ToInt32(Session["KullaniciID"]);
            p1.Musteri = deneme;

            return View(p1);
        }























    }
}