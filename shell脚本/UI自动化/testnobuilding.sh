#!/bin/bash
#xcrun simctl list 查看可使用模拟器
#xctestrun测试不能带这些-workspace "/Users/zhoufei/Documents/DemoDir/demo.xcworkspace" -scheme "demo" \

cd /Users/zhoufei/Documents/DemoDir

#清理旧报告
resultReport="/Users/zhoufei/Documents/myShell/Result"
if [ -d ${resultReport} ]; then
	rm -rf ${resultReport} 
fi

#并发UI测试
xcodebuild test-without-building \
-sdk "iphonesimulator" \
-destination "platform=iOS Simulator,name=iPhone 6,OS=12.0" \
-xctestrun "output/Build/Products/demo_iphonesimulator12.0-x86_64.xctestrun" \
-only-testing:"TargetName/ClassName/MethodName" \
-resultBundlePath "${resultReport}"
#-parallel-testing-worker-count "1" \

#生成测试报告
xchtmlreport -r "${resultReport}"
open "${resultReport}/index.html"

#-only-testing:"TargetName/ClassName/MethodName"
#-maximum-concurrent-test-device-destinations 4     最大真机并发数，默认不限制
#-maximum-concurrent-test-simulator-destinations 4  最大模拟器并发数，默认不限制
#-disable-concurrent-destination-testing            串行执行测试
#-parallel-testing-worker-count 4                   并行测试期间生成的测试运行器的确切数量
#-destination "platform=iOS Simulator,name=iPhone 6,OS=12.0" 可以指定多个模拟器

#测试报告查看
:<<EOF
结合xchtmlreport命令可以产生多设备测试结果报告
修改默认的-resultBundlePath 参数
-resultBundlePath 自定义目录

//安装xchtmlreport报告工具
brew install https://raw.githubusercontent.com/TitouanVanBelle/XCTestHTMLReport/develop/xchtmlreport.rb
//查看报告
xchtmlreport -r 自定义目录
EOF


#模拟器安装app
:<<EOF
安装npm
brew install npm 

安装ios-sim
(方法1)
npm install -g ios-sim
(方法2)
1.下载地址：https://github.com/phonegap/ios-sim/
2.安装，执行命令：brew install ios-sim  (注意：先cd到ios-sim所在目录，然后执行该命令进行安装)

安装app
ios-sim launch Demo.app
安装指定app到指定模拟器中
1.找到要安装的模拟器：ios-sim showdevicetypes
2.安装启动：
ios-sim launch /Users/op-mac1/Desktop/gameipa/KingOfFight-iOS.app \
--devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6


ios-sim命令
ios-sim install APPLICATIONPATH
ios-sim launch APPLICATIONPATH
ios-sim showdevicetypes
ios-sim showsdks
ios-sim start
EOF

