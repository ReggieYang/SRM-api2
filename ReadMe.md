#Software Risk Management

##Usage
1. Use the network in nju-software.
2. https://192.168.47.29:11111/SRM2/login

##Tips
1. Only PM can add projects, and all the people in the company will become developers of the project.


##需求分析（第二阶段）

###商品功能：
	SF1.项目管理：项目的发布，修改，删除，参与，项目人员的分配
	SF2.风险管理：风险条目（包括风险内容、可能性（高中低）、影响程度（高中低）、触发器/阈值、提交者、跟踪者等信息）的输入，修改，删除
    SF3.用户管理：用户的注册，登录
    SF4.风险跟踪：跟踪记录的输入，修改，删除
###用户界面：
	UI1.用户登陆界面
		UI1.1注册界面
		UI1.2登陆界面
	UI2.系统主界面：显示项目列表，近期更新动态
        UI2.1.项目（风险管理计划）详情界面：显示项目对应的风险条目
			UI2.1.1.风险详情界面：列表显示风险条目；列表显示跟踪条目
				增加风险：可显示
			UI2.1.1.1跟踪详情界面：内容同风险界面，可用于更新风险；
		UI2.2动态展示界面：显示最新更新的条目，类别及对应项目
	UI2.2统计界面
	

##Table Structure：

###Risk: 
    risk_id, possibility, impact(影响程度), trigger(触发器), creator_name, 
    follower_name, description, risk_type, status, update_time, parent_risk_id, project_id

###FollowUp(跟进): 
    followup_id, possibility, impact(影响程度), trigger(触发器), creator_name, 
    follower_name, description, risk_type, status, update_time, parent_risk_id, project_id, risk_id

###User: 
    user_name, position, password, company

###project: 
    project_id, project_name

###project_developers: 
    project_id, developer_name
