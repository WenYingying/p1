using System;
namespace Model
{

    /// <summary>
    /// 会议室信息
    /// </summary>
    public class ConferenceRoom
    {
        /// <summary>
        /// 会议室编号
        /// </summary>
        public int? ID { set; get; }
        /// <summary>
        /// 会议室名称
        /// </summary>
        public string Name { set; get; }
        /// <summary>
        /// 会议室详细地址
        /// </summary>
        public string Addr { set; get; }
        /// <summary>
        /// 会议室说明
        /// </summary>
        public string MarkUp { set; get; }
        /// <summary>
        /// 添加人员ID
        /// </summary>
        public int? AdminId { set; get; }
        /// <summary>
        /// 添加时间
        /// </summary>
        public string PostTime { set; get; }
    }
}

