using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

/// <summary>
/// Common 的摘要说明
/// </summary>
public class Common
{
    private static readonly Common Instance = new Common();
    private Common()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static Common GetInstance
    {
        get { return Instance; }
    }

    public void JsonErrorMessage(string exMessage)
    {
        HttpContext.Current.Response.Write(string.Format("{{\"Result\":false,\"Message\":\"{0}\"}}", new System.Text.RegularExpressions.Regex("\\n|\\r|\\(|\\)| |\"|\\\\").Replace(exMessage, "")));
    }
    public string ErrorMessage(string exMessage)
    {
        return string.Format("{{\"Result\":false,\"Message\":\"{0}\"}}", new System.Text.RegularExpressions.Regex("\\n|\\r|\\(|\\)| |\"|\\\\").Replace(exMessage, ""));
    }
    public bool IsMobilePhone(string phoneNum)
    {
        return System.Text.RegularExpressions.Regex.IsMatch(phoneNum, @"^1([3,5]|7|8)\d{9}$");
    }
    public int GenerateCode()
    {
        long t = DateTime.Now.Ticks;
        Random rnd = new Random((int)(t & 0xffffffffL) | (int)(t >> 32));
        int result = rnd.Next(999999);
        if (result < 100000) return GenerateCode();
        return result;
    }

    public byte[] CreateCheckCodeImage(string checkCode, HttpResponse res)
    {
        if (checkCode == null || checkCode.Trim() == String.Empty)
            return null;

        System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling((checkCode.Length * 13.5)), 31);
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(image);

        try
        {
            //生成随机生成器
            Random random = new Random();

            //清空图片背景色
            g.Clear(System.Drawing.Color.White);

            //画图片的背景噪音线
            //for (int i = 0; i < 25; i++)
            //{
            //    int x1 = random.Next(image.Width);
            //    int x2 = random.Next(image.Width);
            //    int y1 = random.Next(image.Height);
            //    int y2 = random.Next(image.Height);

            //    g.DrawLine(new System.Drawing.Pen(System.Drawing.Color.Silver), x1, y1, x2, y2);
            //}

            System.Drawing.Font font = new System.Drawing.Font("Arial", 16, (System.Drawing.FontStyle.Bold));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new System.Drawing.Rectangle(0, 0, image.Width, image.Height), System.Drawing.Color.Blue, System.Drawing.Color.DarkRed, 1.2f, true);
            g.DrawString(checkCode, font, brush, 1, 1);

            //画图片的前景噪音点
            //for (int i = 0; i < 100; i++)
            //{
            //    int x = random.Next(image.Width);
            //    int y = random.Next(image.Height);

            //    image.SetPixel(x, y, System.Drawing.Color.FromArgb(random.Next()));
            //}

            //画图片的边框线
            g.DrawRectangle(new System.Drawing.Pen(System.Drawing.Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            return ms.ToArray();

            //res.ClearContent();
            //res.ContentType = "image/Gif";
            //res.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }

    public string FormatDate(DateTime d,string format)
    {
        return d.ToString(format);
    }

    /// <summary>    
    /// 把数据从Excel装载到DataTable    
    /// </summary>    
    /// <param name="pathName">带路径的Excel文件名</param>    
    /// <param name="sheetName">工作表名</param>
    /// <param name="tbContainer">将数据存入的DataTable</param>
    /// <returns></returns> 
    public static System.Data.DataTable ExcelToDataTable(string pathName, string sheetName)
    {
        System.Data.DataTable tbContainer = new System.Data.DataTable();
        string strConn = string.Empty;
        if (string.IsNullOrEmpty(sheetName))
        {
            sheetName = "Sheet1";
        }
        FileInfo file = new FileInfo(pathName);
        if (!file.Exists)
        {
            throw new Exception("文件不存在");
        }
        string extension = file.Extension;
        switch (extension)
        {
            case ".xls":
                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + pathName + ";Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'";
                break;
            case ".xlsx":
                strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + pathName + ";Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;'";
                break;
            default:
                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + pathName + ";Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'";
                break;
        }
        //链接Excel
        OleDbConnection cnnxls = new OleDbConnection(strConn);
        //读取Excel里面有 表Sheet1
        OleDbDataAdapter oda = new OleDbDataAdapter(string.Format("select * from [{0}$]", sheetName), cnnxls);
        DataSet ds = new DataSet();
        //将Excel里面有表内容装载到内存表中！
        oda.Fill(tbContainer);
        return tbContainer;
    }
    public static void CreateXml(string path)
    {
        XmlDocument xmldoc = new XmlDocument();
        //加入XML的声明段落,<?xml version="1.0" encoding="gb2312"?>
        XmlDeclaration xmldecl;
        xmldecl = xmldoc.CreateXmlDeclaration("1.0", "gb2312", null);
        xmldoc.AppendChild(xmldecl);
        //加入一个根元素
        XmlNode xmlelem = xmldoc.CreateElement("", "Operating", "");
        xmldoc.AppendChild(xmlelem);
        //保存创建好的XML文档
        xmldoc.Save(path);
    }

    public string Trim(string s)
    {
        return string.IsNullOrEmpty(s) ? string.Empty : s.Trim();
    }

    public string ReplaceHtmlTag(string html, int length = 0)
    {
        string strText = System.Text.RegularExpressions.Regex.Replace(html, "<[^>]+>", "");
        strText = System.Text.RegularExpressions.Regex.Replace(strText, "&[^;]+;", "");

        if (length > 0 && strText.Length > length)
            return strText.Substring(0, length);

        return strText;
    }

    public string GetInfoType(string t)
    {
        switch (t.ToLower())
        {
            case "news":
                return "新闻资讯";
            case "trade":
                return "行业资讯";
            case "policy":
                return "政策法规";
            case "knowlage":
                return "知识库";
            case "notice":
                return "公告";
        }
        return "未知类别";
    }

}