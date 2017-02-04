using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Text.RegularExpressions;

public class ImageHandler
{
    // Methods
    private ImageHandler()
    {
    }

    private static Bitmap CreateThumbnail(Bitmap source, int thumbWi, int thumbHi, bool maintainAspect)
    {
        if ((source.Width < thumbWi) && (source.Height < thumbHi))
        {
            return source;
        }
        Bitmap image = null;
        try
        {
            int width = thumbWi;
            int height = thumbHi;
            if (maintainAspect)
            {
                if (source.Width > source.Height)
                {
                    width = thumbWi;
                    height = (int)(Math.Ceiling(source.Height * (Convert.ToDouble(thumbWi) / Convert.ToDouble(source.Width))));
                }
                else
                {
                    height = thumbHi;
                    width = (int)(Math.Ceiling(source.Width * (Convert.ToDouble(thumbHi) / Convert.ToDouble(source.Height))));
                }
            }
            image = new Bitmap(width, height);
            using (Graphics graphics = Graphics.FromImage(image))
            {
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.Clear(Color.White);
                graphics.FillRectangle(Brushes.White, 0, 0, width, height);
                graphics.DrawImage(source, 0, 0, width, height);
            }
            source.Dispose();
        }
        catch
        {
            image = null;
        }
        return image;
    }

    private static Bitmap CutImage(string sourcefile, int x, int y, int x2, int y2)
    {
        Bitmap image = (Bitmap)Image.FromFile(sourcefile);
        Bitmap bitmap2 = new Bitmap(x2 - x, y2 - y, PixelFormat.Format64bppPArgb);
        using (Graphics graphics = Graphics.FromImage(bitmap2))
        {
            Rectangle srcRect = new Rectangle(x, y, x2 - x, y2 - y);
            Rectangle destRect = new Rectangle(0, 0, x2 - x, y2 - y);
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.SmoothingMode = SmoothingMode.HighQuality;
            graphics.DrawImage(image, destRect, srcRect, GraphicsUnit.Pixel);
            image.Dispose();
        }
        return bitmap2;
    }

    private static EncoderParameters GetEncoderParameters(long quality)
    {
        EncoderParameters parameters = new EncoderParameters();
        EncoderParameter parameter = new EncoderParameter(Encoder.Quality, quality);
        parameters.Param[0] = parameter;
        return parameters;
    }

    private static ImageCodecInfo GetImageCodecInfo(string Imgformate)
    {
        foreach (ImageCodecInfo info2 in ImageCodecInfo.GetImageEncoders())
        {
            if (info2.FormatDescription.Equals(Imgformate))
            {
                return info2;
            }
        }
        return null;
    }

    public static void SaveImageFromFile(int thumbWi, int thumbHi, string sourcefile, string filename, string formate, long quality, ref int wi, ref int hi)
    {
        try
        {
            using (Bitmap bitmap = CreateThumbnail((Bitmap)Image.FromFile(sourcefile), thumbWi, thumbHi, true))
            {
                string path = filename.Substring(0, filename.LastIndexOf('\\'));
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (File.Exists(filename))
                {
                    File.Delete(filename);
                }
                bitmap.Save(filename, GetImageCodecInfo(formate), GetEncoderParameters(quality));
                wi = bitmap.Width;
                hi = bitmap.Height;
                bitmap.Dispose();
            }
        }
        catch (Exception exception)
        {
            throw new Exception(new Regex("\\n|\\r|\\(|\\)| |\"").Replace(exception.Message, ""));
        }
    }

    public static void SaveImageFromFile(int thumbWi, int thumbHi, string sourcefile, string filename, string formate, long quality, int x, int y, int x2, int y2, ref int wi, ref int hi)
    {
        try
        {
            using (Bitmap bitmap = CreateThumbnail(CutImage(sourcefile, x, y, x2, y2), thumbWi, thumbHi, true))
            {
                string path = filename.Substring(0, filename.LastIndexOf('\\'));
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (File.Exists(filename))
                {
                    File.Delete(filename);
                }
                bitmap.Save(filename, GetImageCodecInfo(formate), GetEncoderParameters(quality));
                wi = bitmap.Width;
                hi = bitmap.Height;
                bitmap.Dispose();
            }
        }
        catch (Exception exception)
        {
            throw new Exception(new Regex("\\n|\\r|\\(|\\)| |\"").Replace(exception.Message, ""));
        }
    }

    public static void SaveImageFromStream(Stream filestream, string filename)
    {
        try
        {
            using (Bitmap bitmap = (Bitmap)Image.FromStream(filestream))
            {
                string path = filename.Substring(0, filename.LastIndexOf('\\'));
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (File.Exists(filename))
                {
                    File.Delete(filename);
                }
                bitmap.Save(filename);
                bitmap.Dispose();
            }
        }
        catch (Exception exception)
        {
            throw new Exception(new Regex("\\n|\\r|\\(|\\)| |\"").Replace(exception.Message, ""));
        }
    }

    public static void SaveImageFromStream(Stream filestream, int thumbWi, int thumbHi, string filename, string formate, long quality, ref int wi, ref int hi)
    {
        try
        {
            using (Bitmap bitmap = CreateThumbnail((Bitmap)Image.FromStream(filestream), thumbWi, thumbHi, true))
            {
                string path = filename.Substring(0, filename.LastIndexOf('\\'));
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (File.Exists(filename))
                {
                    File.Delete(filename);
                }
                bitmap.Save(filename, GetImageCodecInfo(formate), GetEncoderParameters(quality));
                wi = bitmap.Width;
                hi = bitmap.Height;
                bitmap.Dispose();
            }
        }
        catch (Exception exception)
        {
            throw new Exception(new Regex("\\n|\\r|\\(|\\)| |\"").Replace(exception.Message, ""));
        }
    }
}

