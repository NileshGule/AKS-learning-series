using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TechTalksAPI.Model;
using TechTalksModel.DTO;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TechTalksAPI.Controllers
{
    [Route("api/[controller]")]
    public class TechTalksController : Controller
    {
        private readonly TechTalksDBContext _context;
        
        public TechTalksController(TechTalksDBContext context)
        {
            _context = context;
        }

        // GET: api/TechTalks
        [HttpGet]
        public IEnumerable<TechTalk> GetAll()
        {
            List<TechTalk> techTalks = _context.TechTalk
                .Include(t => t.Category)
                .Include(t => t.Level)
                .ToList();

            return techTalks;
            
        }

        [HttpGet("{id}", Name = "GetTechTalkById", Order = 1)]
        //GET: api/TechTalks/1
        public TechTalk GetById(int id)
        {
            var item = _context.TechTalk.FirstOrDefault(o => o.Id.Equals(id));
            return item;
        }

        // POST api/TechTalks
        [HttpPost]
        public IActionResult Create([FromBody]TechTalkDTO techTalkDto)
        {
            if (techTalkDto == null)
            {
                return BadRequest();
            }

            TechTalk techTalk = new TechTalk
            {
                TechTalkName = techTalkDto.TechTalkName,
                CategoryId = techTalkDto.CategoryId,
                Category = _context.Categories.FirstOrDefault(x => x.Id == techTalkDto.CategoryId),
                LevelId = techTalkDto.LevelId,
                Level = _context.Levels.FirstOrDefault(x => x.Id == techTalkDto.LevelId)
            };

            Console.WriteLine("Saving Tech talk to database.");

            Console.WriteLine($"Tech Talk Id : {techTalk.Id}");
            Console.WriteLine($"Tech Talk Name : {techTalk.TechTalkName}");
            Console.WriteLine($"Category : {techTalk.CategoryId}");
            Console.WriteLine($"Level : {techTalk.LevelId}");

            try
            {
                _context.TechTalk.Add(techTalk);
                _context.Entry(techTalk.Category).State = EntityState.Unchanged;
                _context.Entry(techTalk.Level).State = EntityState.Unchanged;
                _context.SaveChanges();  
            }
            catch (Exception ex)
            {
                Console.WriteLine("Inside exception block");
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.InnerException);
            }
    
            
            return Ok();
        }

        // PUT api/TechTalks/5
        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody]TechTalk item)
        {
            if (item == null || !item.Id.Equals(id))
            {
                return BadRequest();
            }

            var techTalk = _context.TechTalk.FirstOrDefault(t => t.Id.Equals(id));
            if (techTalk == null)
            {
                return NotFound();
            }

            techTalk.TechTalkName = item.TechTalkName;

            _context.TechTalk.Update(techTalk);
            _context.SaveChanges();
            return new NoContentResult();
        }

        // DELETE api/TechTalks/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var kv = _context.TechTalk
                        .FirstOrDefault(t => t.Id.Equals(id));

            if (kv == null)
            {
                return NotFound();
            }

            _context.TechTalk.Remove(kv);
            _context.SaveChanges();

            return new NoContentResult();
        }
    }
}
