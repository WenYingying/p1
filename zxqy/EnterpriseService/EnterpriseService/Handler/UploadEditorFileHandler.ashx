<%@ WebHandler Language="C#" Class="UploadEditorFileHandler" %>

using System;
using System.Web;

public class UploadEditorFileHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (object.Equals(null, req.Files["filedata"]))
                throw new Exception("信息缺失");


            string filename = string.Empty, filetype = "", logicname = string.Format(@"{0}{1}", Common.GetInstance.FormatDate(DateTime.Now, "yyyyMMddHHmmssfff"), Common.GetInstance.GenerateCode());
            System.IO.Stream stream = null;

            if (!object.Equals(null, req.Files["filedata"]))
            {
                filetype = req.Files["filedata"].FileName.Substring(req.Files["filedata"].FileName.LastIndexOf('.') + 1, req.Files["filedata"].FileName.Length - req.Files["filedata"].FileName.LastIndexOf('.') - 1).ToUpper();
                stream = req.Files["filedata"].InputStream;
            }
            filename = string.Format(@"{0}\Files\EditorFiles\{1}\{2}\{3}\", System.Configuration.ConfigurationManager.AppSettings["FileRoot"], DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"));
            if (!System.IO.Directory.Exists(filename))
            {
                System.IO.Directory.CreateDirectory(filename);
            }
            filename = string.Format("{0}{1}.{2}", filename, logicname, filetype);
            using (System.IO.FileStream fs = new System.IO.FileStream(filename, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write))
            {
                byte[] buffer = new byte[stream.Length];
                stream.Read(buffer, 0, buffer.Length);
                fs.Write(buffer, 0, buffer.Length);
                fs.Flush();
                fs.Close();
            }
            //{"err":"","msg":"200906030521128703.gif"}
            //{"err":"1","msg":"20161125123156608432631.jpg"}
            res.Write(string.Format("{{\"err\":\"\",\"msg\":\"{0}EditorFiles/{1}/{2}/{3}/{4}.{5}\"}}",System.Configuration.ConfigurationManager.AppSettings["FileUrl"],logicname.Substring(0,4),logicname.Substring(4,2),logicname.Substring(6,2), logicname, filetype.ToLower()));
        }
        catch (Exception ex)
        {
            res.Write(string.Format("{{\"err\":\"{0}\",\"msg\":\"\"}}",new System.Text.RegularExpressions.Regex("\\n|\\r|\\(|\\)| |\"|\\\\").Replace(ex.Message, "")));
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}