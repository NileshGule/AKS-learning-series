using Microsoft.EntityFrameworkCore;

namespace TechTalksAPI.Model
{
    public class TechTalksDBContext : DbContext
    {
        public TechTalksDBContext(DbContextOptions<TechTalksDBContext> options)
            : base(options)
        {
        }
        
        public DbSet<TechTalk> TechTalk { get; set; }

        public DbSet<Category> Categories { get; set; }

        public DbSet<Level> Levels { get; set; }
    }
}