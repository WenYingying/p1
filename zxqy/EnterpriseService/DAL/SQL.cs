using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static class SQL<T>
    {
        public static string Insert(T _obj)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(" INSERT {0} ", typeof(T).Name);
            StringBuilder sbCol = new StringBuilder(), sbVal = new StringBuilder();
            foreach (PropertyInfo p in typeof(T).GetProperties())
            {
                if (p.GetValue(_obj)==null)
                {
                    continue;
                }
                sbCol.AppendFormat("{0},", p.Name);
                sbVal.AppendFormat("'{0}',", p.GetValue(_obj));
            }
            if (sbCol[sbCol.Length - 1] == ',')
                sbCol.Remove(sbCol.Length - 1, 1);
            if (sbVal[sbVal.Length - 1] == ',')
                sbVal.Remove(sbVal.Length - 1, 1);
            sb.AppendFormat("({0})", sbCol.ToString());
            sb.Append(" VALUES ");
            sb.AppendFormat("({0})", sbVal.ToString());
            return sb.ToString();
        }

        public static string Update(T _obj,string select_search)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(" UPDATE {0} SET ", typeof(T).Name);
            StringBuilder sbCol = new StringBuilder(), sbVal = new StringBuilder();
            foreach (PropertyInfo p in typeof(T).GetProperties())
            {
                if (p.GetValue(_obj)==null||p.Name.ToLower()=="id")
                {
                    continue;
                }
                sb.AppendFormat("{0}='{1}',", p.Name, p.GetValue(_obj));
            }
            if (sb[sb.Length - 1] == ',')
                sb.Remove(sb.Length - 1, 1);
            sb.AppendFormat(" WHERE 1=1 {0}", select_search);
            return sb.ToString();
        }
    }

}
