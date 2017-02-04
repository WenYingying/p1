<%@ WebHandler Language="C#" Class="UploadFileHandler" %>

using System;
using System.Web;

public class UploadFileHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if ((object.Equals(null, req.Files["file"]) && string.IsNullOrEmpty(req.Form["base64File"])) || string.IsNullOrEmpty(req.Form["fileDir"]))
                throw new Exception("信息缺失");


            string filename = string.Empty, filetype = "", logicname = string.Format(@"{0}{1}",Common.GetInstance.FormatDate(DateTime.Now, "yyyyMMddHHmmssfff"), Common.GetInstance.GenerateCode());
            if (!string.IsNullOrEmpty(req.Form["LogicName"]))
                logicname = server.UrlDecode(req.Form["LogicName"].Trim());
            System.IO.Stream stream = null;

            if (!object.Equals(null, req.Files["file"]))
            {
                filetype = req.Files["file"].FileName.Substring(req.Files["file"].FileName.LastIndexOf('.') + 1, req.Files["file"].FileName.Length - req.Files["file"].FileName.LastIndexOf('.') - 1).ToUpper();
                stream = req.Files["file"].InputStream;
            }
            else if (!string.IsNullOrEmpty(req.Form["base64File"]))
            {
                string[] fileArr = req.Form["base64File"].Split(',');
                if (fileArr.Length != 2)
                {
                    Common.GetInstance.JsonErrorMessage("文件错误");
                    return;
                }
                filetype = fileArr[0].Replace("data:image/", string.Empty).Replace(";base64", string.Empty).ToUpper();
                stream = (System.IO.Stream)(new System.IO.MemoryStream(Convert.FromBase64String(fileArr[1])));
            }
            if (filetype == "JPG")
            {
                filetype = "JPEG";
            }
            filename = string.Format(@"{0}\Files\{1}\{2}\{3}\{4}\", System.Configuration.ConfigurationManager.AppSettings["FileRoot"], req.Form["fileDir"].Trim(), DateTime.Now.ToString("yyyy"),DateTime.Now.ToString("MM"),DateTime.Now.ToString("dd"));
            if (!System.IO.Directory.Exists(filename))
            {
                System.IO.Directory.CreateDirectory(filename);
            }
            filename = string.Format("{0}{1}.{2}", filename, logicname, filetype);
            if (string.IsNullOrEmpty(req.Form["isImg"]) || req.Form["isImg"].Trim().ToLower() == "false")
            {
                using (System.IO.FileStream fs = new System.IO.FileStream(filename, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write))
                {
                    byte[] buffer = new byte[stream.Length];
                    stream.Read(buffer, 0, buffer.Length);
                    fs.Write(buffer, 0, buffer.Length);
                    fs.Flush();
                    fs.Close();
                }
            }
            else
            {
                int wi = 0, hi = 0;
                ImageHandler.SaveImageFromStream(stream, int.Parse(req.Form["Width"]), int.Parse(req.Form["Height"]), filename, filetype, 75, ref wi, ref hi);
            }
            res.Write(string.Format("{{\"Result\":true,\"Message\":\"上传成功\",\"Src\":\"{0}.{1}\"}}", logicname, filetype.ToLower()));
        }
        catch (Exception ex)
        {
            Common.GetInstance.JsonErrorMessage(ex.Message);
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