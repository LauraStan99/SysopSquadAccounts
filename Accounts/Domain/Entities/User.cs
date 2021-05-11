using System.Collections.Generic;
using Domain.Common;

namespace Domain.Entities
{
    public class User : BaseEntity
    {
        public List<string> TicketsId { get; set; } = new List<string>();
        public string Type { get; set; }

        public void AddTicket(string ticketId)
        {
            TicketsId.Add(ticketId);
        }
    }
}
