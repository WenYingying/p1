using System;
namespace Model
{

    /// <summary>
    /// 网站首页Banner图管理
    /// </summary>
    public class Banner
    {
        /// <summary>
        /// Banner编号
        /// </summary>
        public int? ID { set; get; }
        /// <summary>
        /// 文件名称
        /// </summary>
        public string FileName { set; get; }
        /// <summary>
        /// 上传管理员
        /// </summary>
        public int? AdminId { set; get; }
        /// <summary>
        /// 顺序
        /// </summary>
        public int? Order { set; get; }
        /// <summary>
        /// 状态
        /// </summary>
        public int? State { set; get; }
        /// <summary>
        /// 上传时间
        /// </summary>
        public string PostTime { set; get; }
    }
}

