//m_Multiple = m_RotSpeed*m_Mass
m_RotSpeed *= m_RotFriction;
m_RotSpeed = median(-m_MaxRotSpeed,m_MaxRotSpeed,m_RotSpeed);
m_OldAngle = image_angle;
image_angle += m_RotSpeed;
