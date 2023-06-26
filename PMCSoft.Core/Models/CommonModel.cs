using PMCSoft.Core.Interfaces.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Models
{
    public class HierarchyNode<T> where T : class
    {
        public T Entity { get; set; }
        public IEnumerable<HierarchyNode<T>> ParentNodes { get; set; }
        public IEnumerable<HierarchyNode<T>> ChildNodes { get; set; }
        public int Depth { get; set; }
        public T Parent { get; set; }
    }


    public abstract class BaseEntity
    {

    }

    public abstract class Entity<T> : BaseEntity, IEntity<T>
    {
        public virtual T Id { get; set; }
    }

    public abstract class AuditableEntity
    {
        public long CultureId { get; set; }
        public Byte Status { get; set; }
        public bool IsPublished { get; set; }
        public long CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }

    }
}
