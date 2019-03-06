<#include "/macro/base.ftl" />
<div class="bjui-pageHeader">
	<form id="pagerForm" data-toggle="ajaxsearch" action="${base}/course/courseRecommend/list" method="post">
		<@pageHeadr />
		<div class="bjui-searchBar">
		<a href="${base}/course/courseRecommend/add?categoryId=${bean.categoryId!}" class="btn btn-default" data-toggle="dialog" data-icon="plus" data-id="courseCourseRecommend-add" data-options="{title:'添加', height:250}">课程添加 </a>
		<span class="fa fa-info-circle red"> 因为展示的限制，课程只展示最前面的5个</span>
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
	<table class="table table-bordered table-hover table-top" data-toggle="tablefixed" data-selected-multi="true">
		<thead>
			<tr>
				<th width="30">序号</th>
				<th>课程名称</th>
				<th>排序</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<#if page??>
			<#list page.list as bean>
			<tr>
				<td align="center">${bean_index+1}</td>
				<td>
					<a href="${base}/course/course/view?id=${bean.courseId!}" data-toggle="dialog" data-options="{mask:true,title:'${bean.courseName}-详细信息',width:900,height:600}">${bean.courseName!}</a>
				</td>
				<td>${bean.sort!}</td>
				<td><#list statusIdEnums as em><#if bean.statusId?? && bean.statusId==em.code><span class="${em.color}">${em.desc}</span></#if></#list></td>
				<td>
					<a href="${base}/course/courseRecommend/edit?id=${bean.id}" class="btn btn-green" data-toggle="navtab" data-options="{title:'${bean.courseName}',id:'${bean.courseName}'}">修改</a>
				    <a href="${base}/course/courseRecommend/delete?id=${bean.id}" class="btn btn-red" data-toggle="doajax" data-id="courseCategory-delete" data-confirm-msg="确定要删除吗？">删除</a>

				</td>
			</tr>
			</#list>
			</#if>
		</tbody>
	</table>
</div>
<@pageFooter />
