<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPager.ascx.cs" Inherits="UserControls_ucPager" %>
<div class="pager">
    <a href="<%=url %><%=filetype %>?PageNo=<%=ipage>2?ipage-1:1 %><%=query %>" class="prevpage">上一页</a>
    <a href="<%=url %><%=filetype %>?PageNo=1<%=query %>" <%=1==ipage?"class='focus'":"" %> title="第1页">1</a>
    <%if (showFrontSplit)
      { %>
    <a>...</a>
    <%} %>
    <%for (int i = startPageNo; i < endPageNo + 1; i++)
      { %>
    <a href="<%=url %><%=filetype %>?PageNo=<%=i %><%=query %>" <%=i==ipage?"class='focus'":"" %> title="第<%=i %>页"><%=i %></a>
    <%} %>
    <%if (showBackSplit)
      { %>
    <a>...</a>
    <%} %>
    <%if (pagecnt > 1)
      { %>
    <a href="<%=url %><%=filetype %>?PageNo=<%=pagecnt %><%=query %>" <%=pagecnt==ipage?"class='focus'":"" %> title="第<%=pagecnt %>页"><%=pagecnt%></a>
    <%} %>
    <a href="<%=url %><%=filetype %>?PageNo=<%=ipage+1>pagecnt?pagecnt:ipage+1 %><%=query %>" class="nextpage">下一页</a>
</div>