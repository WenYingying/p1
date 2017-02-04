using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.ConferenceRoomDAL
{
    public class Insert : AbstractFactory.IFactory<Model.ConferenceRoom>
    {
        public bool Parameter(ConferenceRoom _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(SQL<ConferenceRoom>.Insert(_obj)) > 0;
        }

        public List<ConferenceRoom> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<ConferenceRoom> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
