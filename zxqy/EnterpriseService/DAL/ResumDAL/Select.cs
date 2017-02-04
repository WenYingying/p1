using System;
using System.Collections.Generic;
using AbstractFactory;
using Model;
using System.Data.SqlClient;
using System.Reflection;

namespace DAL.ResumDAL
{
    public class Select : IFactory<Resum>
    {
        #region IFactory<Resum> 成员

        public bool Parameter(Resum _Resum)
        {
            throw new NotImplementedException();
        }

        public List<Resum> Parameter(string select_list, string select_search)
        {
            string sqltext = string.Format("SELECT {0} FROM View_Resum WHERE 1=1 {1}", select_list, select_search);
            List<Resum> list = new List<Resum>();
            using (SqlDataReader dr = DataAccess.SqlAccess().ExecuteReader(sqltext))
            {
                Type t = typeof(Resum);
                while (dr.Read())
                {
                    Resum _obj = new Resum();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        if (object.Equals(DBNull.Value, dr[i]))
                            continue;
                        PropertyInfo pi = t.GetProperty(dr.GetName(i));
                        if (pi.PropertyType.IsGenericType && pi.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                        {
                            pi.SetValue(_obj, Convert.ChangeType(dr[i], new System.ComponentModel.NullableConverter(pi.PropertyType).UnderlyingType));
                            continue;
                        }
                        pi.SetValue(_obj, Convert.ChangeType(dr[i], pi.PropertyType), null);
                    }

                    list.Add(_obj);
                }
            }

            return list;
        }

        public List<Resum> Parameter(string select_list, string select_search, string select_order, int PageIndex, int PageSize, ref int PageCount, ref int TotalCnt)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
