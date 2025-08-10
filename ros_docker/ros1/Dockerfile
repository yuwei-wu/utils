# CPU version with software OpenGL rendering
FROM osrf/ros:noetic-desktop-full


ENV DEBIAN_FRONTEND=noninteractive

# Update and install ROS desktop and catkin tools
RUN apt-get update && apt-get install -y \
    ros-noetic-desktop-full \
    python3-catkin-tools \
    && rm -rf /var/lib/apt/lists/*
    
# Force software rendering for OpenGL apps
ENV LIBGL_ALWAYS_SOFTWARE=1

# Setup ROS environment in bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Setup entrypoint
COPY ./ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]


