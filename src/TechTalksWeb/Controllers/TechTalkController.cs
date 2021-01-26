using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using TechTalksWeb.Models;
using TechTalksModel.DTO;
using TechTalksWeb.ViewModels;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;
using System.IO;

namespace TechTalksWeb.Controllers
{
    public class TechTalkController : Controller
    {
        private readonly string API_BASE_URL;

        public TechTalkController(IConfiguration config)
        {
            API_BASE_URL = config.GetValue<string>("TechTalksAPIUrl");
            // API_BASE_URL = "http://techtalks.api:8081/api/techtalks";

            Console.WriteLine($"API base URL : {API_BASE_URL}");
        }
        public async Task<IActionResult> Index()
        {
            List<TechTalkDTO> techTalks = new List<TechTalkDTO>();

            try
            {
                var client = new WebClient();

                Console.WriteLine($"Requesting techtalks from API using API BASE URL = {API_BASE_URL}");

                using (var httpClient = new HttpClient())
                {
                    using (var response = await httpClient.GetAsync(API_BASE_URL))
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();

                        Console.WriteLine($"Data returned from API call : {apiResponse}");

                        techTalks.AddRange(JsonConvert.DeserializeObject<List<TechTalkDTO>>(apiResponse));
                    }
                }

                Console.WriteLine($"Number of records in collection : {techTalks.Count()}");

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            var result = new List<TechTalkDTO>
            {
                new TechTalkDTO {Id = 1, TechTalkName="Docker", CategoryId = 1},
                new TechTalkDTO {Id = 2, TechTalkName="Kubernetes", CategoryId = 2}
            };

            if (!techTalks.Any())
            {
                techTalks.AddRange(result);
            }

            return View(techTalks);
        }

        public IActionResult Details(int id)
        {
            string url = String.Concat(API_BASE_URL, id);

            TechTalkDTO techTalk = null;

            try
            {
                var client = new WebClient();
                var response = client.DownloadString(url);

                Console.WriteLine($"Data returned from API call : {response}");

                techTalk = JsonConvert.DeserializeObject<TechTalkDTO>(response);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            if (techTalk != null)
            {
                return View(techTalk);
            }
            else
            {
                return NotFound();
            }
        }

        public IActionResult Create()
        {
            return View(new TechTalkViewModel { CategoryId = 1, LevelId = 1 });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([FromForm] TechTalkViewModel viewModel)
        {
            Console.WriteLine($"Talk name : {viewModel.TechTalkName}");
            Console.WriteLine($"Category ID : {viewModel.CategoryId}");

            try
            {
                var client = new HttpClient();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                Console.WriteLine($"Data is about to be sent to API call");

                string stringData = JsonConvert.SerializeObject(viewModel);
                var contentData = new StringContent(stringData, System.Text.Encoding.UTF8, "application/json");

                HttpResponseMessage response = client.PostAsync(API_BASE_URL, contentData).Result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return RedirectToAction(nameof(Index));
        }

        public IActionResult Delete(int id)
        {
            string url = String.Concat(API_BASE_URL, id);

            try
            {
                var client = new HttpClient();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                Console.WriteLine($"Data is about to be deleted using API call");

                HttpResponseMessage response = client.DeleteAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"Successfully deleted Techalk with Id = {id}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return RedirectToAction(nameof(Index));
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
