namespace TechTalksAPI.Model
{
    public class TechTalk
    {
        public int Id { get; set; }
        public string TechTalkName { get; set; }
        public int CategoryId { get; set; }

        public virtual Category Category { get; set;}

        public int LevelId { get; set; }

        public virtual Level Level { get; set; }
    }
}