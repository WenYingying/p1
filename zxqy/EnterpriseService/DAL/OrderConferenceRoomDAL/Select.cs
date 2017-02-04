﻿using System;
using System.Collections.Generic;
using AbstractFactory;
using Model;
using System.Data.SqlClient;
using System.Reflection;

namespace DAL.OrderConferenceRoomDAL
{
    public class Select : IFactory<OrderConferenceRoom>
    {
        #region IFactory<OrderConferenceRoom> 成员

        public bool Parameter(OrderConferenceRoom _OrderConferenceRoom)
        {
            throw new NotImplementedException();
        }

        public List<OrderConferenceRoom> Parameter(string select_list, string select_search)
        {
            string sqltext = string.Format("SELECT {0} FROM View_OrderConferenceRoom WHERE 1=1 {1}", select_list, select_search);
            List<OrderConferenceRoom> list = new List<OrderConferenceRoom>();
            using (SqlDataReader dr = DataAccess.SqlAccess().ExecuteReader(sqltext))
            {
                Type t = typeof(OrderConferenceRoom);
                while (dr.Read())
                {
                    OrderConferenceRoom _obj = new OrderConferenceRoom();
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

        public List<OrderConferenceRoom> Parameter(string select_list, string select_search, string select_order, int PageIndex, int PageSize, ref int PageCount, ref int TotalCnt)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
