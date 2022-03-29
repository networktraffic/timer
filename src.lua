local timer = { } do
    timer.__index = timer
    
    function timer.new( )
        return setmetatable( { currTime = 0, finishedTime = 0 }, timer )
    end
    
    function timer:start( )
        if self.currTime ~= 0 then
            return
        end
        
        self.currTime = os.clock( )
    end
    
    function timer:stop( )
        if self.currTime ~= 0 then 
            self.finishedTime = os.clock( ) - self.currTime
            self.currTime = 0
        end
    end
    
    function timer:restart( )
        if self.finishedTime ~= 0 then
            self.finishedTime = 0
            self:start( )
        end
    end
end

return timer