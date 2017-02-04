using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.EnterpriseDAL
{
    public class Delete : AbstractFactory.IFactory<Model.Enterprise>
    {
        public bool Parameter(Enterprise _obj)
        {
            string sqltext = string.Format("DELETE FROM Enterprise WHERE ID={0}", _obj.ID);
            return DataAccess.SqlAccess().ExecuteNonQuery(sqltext) > 0;
        }

        public List<Enterprise> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Enterprise> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
