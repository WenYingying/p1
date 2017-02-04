using System;
using System.Collections.Generic;
using AbstractFactory;
using Model;
using System.Data.SqlClient;
using System.Reflection;

namespace DAL.ConferenceRoomDAL
{
    public class Select : IFactory<ConferenceRoom>
    {
        #region IFactory<ConferenceRoom> 成员

        public bool Parameter(ConferenceRoom _ConferenceRoom)
        {
            throw new NotImplementedException();
        }

        public List<ConferenceRoom> Parameter(string select_list, string select_search)
        {
            string sqltext = string.Format("SELECT {0} FROM ConferenceRoom WHERE 1=1 {1}", select_list, select_search);
            List<ConferenceRoom> list = new List<ConferenceRoom>();
            using (SqlDataReader dr = DataAccess.SqlAccess().ExecuteReader(sqltext))
            {
                Type t = typeof(ConferenceRoom);
                while (dr.Read())
                {
                    ConferenceRoom _obj = new ConferenceRoom();
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

        public List<ConferenceRoom> Parameter(string select_list, string select_search, string select_order, int PageIndex, int PageSize, ref int PageCount, ref int TotalCnt)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
