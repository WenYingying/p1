using System;
namespace Model
{

    /// <summary>
    /// 预定会议室信息
    /// </summary>
    public class OrderConferenceRoom
    {
        /// <summary>
        /// 预定编号
        /// </summary>
        public int? ID { set; get; }
        /// <summary>
        /// 预定企业
        /// </summary>
        public long? EnterpriseId { set; get; }
        /// <summary>
        /// 会议室编号
        /// </summary>
        public int? RoomId { set; get; }
        /// <summary>
        /// 开始时间
        /// </summary>
        public string StartTime { set; get; }
        /// <summary>
        /// 结束时间
        /// </summary>
        public string EndTime { set; get; }
        /// <summary>
        /// 附加信息
        /// </summary>
        public string MarkUp { set; get; }
        /// <summary>
        /// 状态:0=未处理,1=通过，-1=失败
        /// </summary>
        public int? State { set; get; }
        /// <summary>
        /// 处理说明
        /// </summary>
        public string Reason { set; get; }
        /// <summary>
        /// 预定人
        /// </summary>
        public long? UserId { set; get; }
        /// <summary>
        /// 预定时间
        /// </summary>
        public string PostTime { set; get; }
        /// <summary>
        /// 会议室名
        /// </summary>
        public string RoomName { set; get; }
        /// <summary>
        /// 企业名
        /// </summary>
        public string CompanyName { set; get; }
        /// <summary>
        /// 会议室地址
        /// </summary>
        public string Addr { set; get; }
    }
}

