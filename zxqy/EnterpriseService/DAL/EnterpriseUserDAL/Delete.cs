﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.EnterpriseUserDAL
{
    public class Delete : AbstractFactory.IFactory<Model.EnterpriseUser>
    {
        public bool Parameter(EnterpriseUser _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(string.Format("DELETE FROM EnterpriseUser WHERE ID={0}", _obj.ID)) > 0;
        }

        public List<EnterpriseUser> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<EnterpriseUser> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
