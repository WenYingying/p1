using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.HrDAL
{
    class Delete : AbstractFactory.IFactory<Model.Hr>
    {
        public bool Parameter(Hr _obj)
        {
            string sqltext = string.Format("DELETE FROM HR WHERE ID={0}",_obj.ID);
            return DataAccess.SqlAccess().ExecuteNonQuery(sqltext) > 0;
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
