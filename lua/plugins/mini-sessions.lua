return {
	'nvim-mini/mini.sessions',
	version = '*',
	opts = {
		directory = vim.fn.stdpath("data") .. "/sessions"
	},
	init = function()
		-- Commands to manage sessions, rather than having to type lua manually
		vim.api.nvim_create_user_command(
			"SessionCreate",
			function(opts)
				MiniSessions.write(opts.fargs[1])
			end,
			{ nargs = 1 }
		)
		vim.api.nvim_create_user_command(
			"SessionDelete",
			function(opts)
				MiniSessions.delete(opts.fargs[1])
			end,
			{
				nargs = 1,
				complete = function(ArgLead, CmdLine, CursorPos)
					local sessions = {}
					for key,_ in pairs(MiniSessions.detected) do
						table.insert(sessions, key)
					end
					return sessions
				end
			}
		)
		vim.api.nvim_create_user_command(
			"Sessions",
			function(opts)
				MiniSessions.select()
			end,
			{ nargs = 0 }
		)
		vim.api.nvim_create_user_command(
			"SessionLoad",
			function(opts)
				MiniSessions.read(opts.fargs[1])
			end,
			{
				nargs = 1,
				complete = function(ArgLead, CmdLine, CursorPos)
					local sessions = {}
					for key,_ in pairs(MiniSessions.detected) do
						table.insert(sessions, key)
					end
					return sessions
				end
			}
		)
	end,
}
