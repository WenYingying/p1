﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL.BannerDAL
{
    public class Update : AbstractFactory.IFactory<Model.Banner>
    {
        public bool Parameter(Banner _obj)
        {
            return DataAccess.SqlAccess().ExecuteNonQuery(SQL<Banner>.Update(_obj, string.Format("AND ID={0}", _obj.ID))) > 0;
        }

        public List<Banner> Parameter(string select_list, string select_search)
        {
            throw new NotImplementedException();
        }

        public List<Banner> Parameter(string select_list, string select_search, string select_order, int pageno, int pagesize, ref int pagecount, ref int recordcount)
        {
            throw new NotImplementedException();
        }
    }
}
