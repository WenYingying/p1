using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.OrderConferenceRoomDAL
{
    public class Delete : AbstractFactory.IFactory<Model.OrderConferenceRoom>
    {
        public bool Parameter(OrderConferenceRoom _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(string.Format("DELETE FROM OrderConferenceRoom WHERE ID={0}", _obj.ID)) > 0;
        }

        public List<OrderConferenceRoom> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<OrderConferenceRoom> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
