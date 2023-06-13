using MVC_Muzik_Magaza.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MVC_Muzik_Magaza.Controllers
{
    public class SatisController : Controller
    {
        private mmagazaEntities db=new mmagazaEntities();


        // GET: Satis
        public ActionResult Index(int sayfa = 1)
        {
            var satis = db.tbl_satis.ToList().ToPagedList(sayfa, 7);
            return View(satis);
        }


        [HttpGet]
        public ActionResult Satisekle()
        {
            List<SelectListItem> musteriler = (from i in db.tbl_musteri.ToList()
                                               select new SelectListItem
                                               {
                                                   Text = i.MusteriAdsoyad,
                                                   Value = i.MusteriID.ToString()
                                               }).ToList();
            ViewBag.must = musteriler;


            List<SelectListItem> urunler = (from i in db.tbl_urun.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.Urunad,
                                                Value = i.UrunID.ToString()
                                            }).ToList();
            ViewBag.urn = urunler;

            return View();

        }

        [HttpPost]
        public ActionResult Satisekle(tbl_satis p)
        {
            List<SelectListItem> musteriler = (from i in db.tbl_musteri.ToList()
                                               select new SelectListItem
                                               {
                                                   Text = i.MusteriAdsoyad,
                                                   Value = i.MusteriID.ToString()
                                               }).ToList();
            ViewBag.must = musteriler;


            List<SelectListItem> urunler = (from i in db.tbl_urun.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.Urunad,
                                                Value = i.UrunID.ToString()
                                            }).ToList();
            ViewBag.urn = urunler;

            var prod = db.tbl_urun.Find(p.tbl_urun.UrunID);

            if (p.Satisadet <= prod.UrunStok)
            {
                if (p.Satisadet == null || p.SatisFiyat == null)
                {
                    return View();
                }
                else
                {
                    var must = db.tbl_musteri.Where(x => x.MusteriID == p.tbl_musteri.MusteriID).FirstOrDefault();
                    p.tbl_musteri = must;

                    var urn = db.tbl_urun.Where(x => x.UrunID == p.tbl_urun.UrunID).FirstOrDefault();
                    p.tbl_urun = urn;


                    if (p.Satistarih == null)
                    {
                        p.Satistarih = DateTime.Now;
                    }

                    db.tbl_satis.Add(p);
                    db.SaveChanges();
                    return RedirectToAction("Index");



                }
            }

            ViewBag.mesaj = "satın alınabilecek adet stoktan fazladır satın alabileceğiniz maksimum adet " + prod.UrunStok.ToString();

            return View(p);

        }


        public ActionResult Sil(int id)
        {

            var satis = db.tbl_satis.Find(id);
            db.tbl_satis.Remove(satis);
            db.SaveChanges();
            return RedirectToAction("Index");

        }


        [HttpGet]
        public ActionResult Satisgetir(int id)
        {
            var bul = db.tbl_satis.Find(id);

            List<SelectListItem> musteriler = (from i in db.tbl_musteri.ToList()
                                               select new SelectListItem
                                               {
                                                   Text = i.MusteriAdsoyad,
                                                   Value = i.MusteriID.ToString()
                                               }).ToList();
            ViewBag.must = musteriler;


            List<SelectListItem> urunler = (from i in db.tbl_urun.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.Urunad,
                                                Value = i.UrunID.ToString()
                                            }).ToList();
            ViewBag.urn = urunler;

            return View("Satisgetir", bul);


        }



        public ActionResult Guncelle(tbl_satis p)
        {
            var sts = db.tbl_satis.Find(p.SatisID);

            var must = db.tbl_musteri.Where(x => x.MusteriID == p.tbl_musteri.MusteriID).FirstOrDefault();
            sts.Musteri = must.MusteriID;

            var urn = db.tbl_urun.Where(x => x.UrunID == p.tbl_urun.UrunID).FirstOrDefault();
            sts.Urun = urn.UrunID;

            sts.Satisadet = p.Satisadet;
            sts.SatisFiyat = p.SatisFiyat;
            if (p.Satistarih == null)
            {
                sts.Satistarih = DateTime.Now;
            }
            else
            {
                sts.Satistarih = p.Satistarih;
            }
            db.SaveChanges();
            return RedirectToAction("Index");




        }











        public int GetFiyat(int id)
        {
            int fiyat = (int)db.tbl_urun.Find(id).UrunFiyat;
            return fiyat;
        }







    }
}