using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.HrDAL
{
    public class Insert : AbstractFactory.IFactory<Model.Hr>
    {
        public bool Parameter(Hr _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(SQL<Hr>.Insert(_obj)) > 0;
        }

        public List<Hr> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Hr> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
