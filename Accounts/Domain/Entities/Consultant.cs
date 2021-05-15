using Domain.Common;

namespace Domain.Entities
{
    public class Consultant : BaseEntity
    {
        public int NumberOfTickets { get; set; }
        public string Skill { get; set; }
        public string Availability { get; set; }
        public int TotalNumberOfTickets { get; set; }
        public int SolvedNumberOfTickets { get; set; }
        public float Score { get; set; }
    }
}
