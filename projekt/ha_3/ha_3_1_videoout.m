if videoart ~= 0
        % create the video writer with 1 fps
      writerObj = VideoWriter('ha_3_1_video_10framesslow.avi');
      writerObj.FrameRate = 10;
      % set the seconds per image
    % open the video writer
    open(writerObj);
    % write the frames to the video
    for i=1:length(Frames)
        % convert the image to a frame
        frame = Frames(i) ;    
        writeVideo(writerObj, frame);
    end
    % close the writer object
    close(writerObj);
end