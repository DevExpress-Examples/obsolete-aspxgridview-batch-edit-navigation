<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx](./VB/Default.aspx))
<!-- default file list end -->
# OBSOLETE - ASPxGridView - How to implement navigation by Up/Left/Down/Right buttons when the Batch Edit mode is used
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t283418)**
<!-- run online end -->


<strong>UPDATED:</strong><br><br>
<p>Starting with version v2016 vol 1 (v16.1), this functionality is available out of the box. Set the grid's <a href="http://help.devexpress.com/#AspNet/DevExpressWebGridBatchEditSettings_StartEditActiontopic">GridViewSettings.SettingsEditing.BatchEditSettings.StartEditAction</a> property to the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebGridViewBatchStartEditActionEnumtopic">FocusedCellClick</a> value to activate it. Please refer to the <a href="https://community.devexpress.com/blogs/aspnet/archive/2016/06/02/asp-net-grid-cell-bands-cell-merging-and-cell-focus-coming-soon-in-v16-1.aspx">ASP.NET Grid - Cell Bands, Cell Merging, and Cell Focus - (Coming soon in v16.1)</a> blog post, the <a href="http://demos.devexpress.com/MVCxGridViewDemos/Editing/BatchEditing">Batch Editing and Updating</a> demo and <a href="https://www.devexpress.com/Support/Center/p/T363560">ASPxGridView - Batch Edit - Provide cell focusing and keyboard navigation</a> thread for more information.<br><br>If you have version v16.1+ available, consider using the built-in functionality instead of the approach detailed below.</p>
<br><strong>For earlier versions:</strong><br><br>In this example, ASPxGridView is used in Batch Edit mode. This feature allows users to move focus from one editable cell to another. Navigation is performed by the Up/Left/Down/Right buttons.<br><br><strong>MVC:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T350476">GridView - How to implement navigation by Up/Left/Down/Right keyboard arrows in the Batch Edit mode </a>

<br/>
<br/>
<p>Please note that our CodeCentral demonstrates this example using the latest available version of our controls.</p>


