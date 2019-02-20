﻿using Bootstrap.DataAccess;
using Longbow.Web.Mvc;
using Xunit;

namespace Bootstrap.Admin.Api
{
    public class LogsTest : ControllerTest
    {
        public LogsTest(BAWebHost factory) : base(factory, "api/Logs") { }

        [Fact]
        public async void Get_Ok()
        {
            var log = new Log() { CRUD = "UnitTest", ClientAgent = "UnitTest", ClientIp = "::1", RequestUrl = "~/UnitTest", UserName = "UnitTest" };
            log.Save(log);

            // 菜单 系统菜单 系统使用条件
            var query = "?sort=LogTime&order=desc&offset=0&limit=20&operateType=&OperateTimeStart=&OperateTimeEnd=&_=1547617573596";
            var qd = await Client.GetAsJsonAsync<QueryData<Log>>(query);
            Assert.NotEmpty(qd.rows);

            // clean
            DbManager.Create().Execute("Delete from Logs where CRUD = @0", log.CRUD);
        }

        [Fact]
        public async void Post_Ok()
        {
            Client.DefaultRequestHeaders.Add("user-agent", "UnitTest");
            var resp = await Client.PostAsJsonAsync<Log, bool>("", new Log() { CRUD = "UnitTest", RequestUrl = "~/UnitTest" });
            Assert.True(resp);

            // clean
            DbManager.Create().Execute("delete from Logs where CRUD = @0", "UnitTest");
        }
    }
}