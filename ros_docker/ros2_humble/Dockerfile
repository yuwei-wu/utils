# CPU version with software OpenGL rendering for ROS 2 Humble
FROM osrf/ros:humble-desktop

ENV DEBIAN_FRONTEND=noninteractive

# Update and install ROS 2 desktop + colcon tools
RUN apt-get update && apt-get install -y \
    ros-humble-desktop \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# Force software rendering for OpenGL apps
ENV LIBGL_ALWAYS_SOFTWARE=1

# Setup ROS 2 environment in bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Copy custom entrypoint
COPY ./ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]

