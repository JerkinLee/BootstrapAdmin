SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Argo Zhang
-- Create date: 2016-09-06
-- Description:	
-- =============================================
CREATE PROCEDURE Proc_StopTerminal
	-- Add the parameters for the stored procedure here
	@tId int
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	delete from TerminalRuleConfig where TerminalID = @tId;
	update Terminals set Status = 0 where Id = @tId;
END
GO
