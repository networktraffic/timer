local timer = { }
timer.__index = timer

function timer.new( )
    return setmetatable( { curr_time = 0, finished_time = 0 }, timer )
end

function timer:start( )
    if self.curr_time ~= 0 then
        return
    end

    self.curr_time = os.clock( )
end

function timer:stop( )
    if self.curr_time ~= 0 then 
        self.finished_time = os.clock( ) - self.curr_time
        self.curr_time = 0
    end
end

function timer:restart( )
    if self.finished_time ~= 0 then
        self.finished_time = 0
        self:start( )
    end
end

function timer:reset( )
	if self.curr_time ~= 0 or self.finished_time ~= 0 then
		self.curr_time = 0
		self.finished_time = 0
	end
end
	
function timer:measure_speed( func )
	self:reset( )
	self:start( )

	func( )
  
	self:stop( )
	return self.finished_time
end

return timer
