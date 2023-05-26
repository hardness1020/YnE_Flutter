import 'package:yne_flutter/features/activity/domain/activity_category.dart';
import 'package:yne_flutter/features/activity/domain/activity.dart';
import 'package:yne_flutter/features/activity/domain/activity_comment.dart';
import 'package:yne_flutter/features/activity/domain/activity_location.dart';
import 'package:yne_flutter/features/backend_user/domain/backend_user.dart';
import 'package:yne_flutter/features/chatroom/domain/chatroom.dart';
import 'package:yne_flutter/features/chatroom/domain/message.dart';

List<ActivityCategory> fakeActivityCategoryList = [
  ActivityCategory(id: '1', name: '游泳'),
  ActivityCategory(id: '2', name: '爬山'),
  ActivityCategory(id: '3', name: '羽球'),
  ActivityCategory(id: '4', name: '網球'),
  ActivityCategory(id: '5', name: '籃球'),
];

List<ActivityLocation> fakeLocationList = [
  ActivityLocation(id: '0', name: '台北'),
  ActivityLocation(id: '1', name: '台中'),
  ActivityLocation(id: '2', name: '台南'),
  ActivityLocation(id: '3', name: '高雄'),
  ActivityLocation(id: '4', name: '基隆'),
];

List<ActivityComment> fakeActivityCommentList = [
  ActivityComment(
    id: '1',
    content: 'Comment 1',
    date: '2021-02-01',
  ),
  ActivityComment(
    id: '2',
    content: 'Comment 2',
    date: '2021-02-02',
  ),
  ActivityComment(
    id: '3',
    content: 'Comment 3',
    date: '2021-02-03',
  ),
  ActivityComment(
    id: '4',
    content: 'Comment 4',
    date: '2021-02-04',
  ),
  ActivityComment(
    id: '5',
    content: 'Comment 5',
    date: '2021-02-05',
  ),
];

BackendUser fakeHeroUser = BackendUser(
  id: '0',
  name: '王小美',
  gender: 'F',
  introduction: '''
  嗨，大家好！我是王小美，很高興在這裡與大家相遇。我是一個充滿活力和熱情的人，總是喜歡探索新事物
  和挑戰自己。我熱愛旅行，喜歡在不同的地方體驗不同的文化和風景。旅行讓我開拓視野，並且學會欣賞和
  尊重不同的價值觀。除了旅行，我也是一個愛好者。我喜歡閱讀書籍、看電影和聆聽音樂。這些活動豐富了
  我的生活，並啟發了我的創造力和思考方式。我相信每一個故事都可以帶給我們新的啟示和洞見。在工作方
  面，我是一個致力於個人成長和專業發展的人。我擁有良好的組織能力和解決問題的能力，並且善於與不同
  背景和文化的人合作。我相信通過持續學習和不斷進步，我可以在自己的領域中取得更大的成就。在這個社
  交媒體平台上，我希望能夠與大家分享我的生活點滴、旅行經歷和一些有趣的事物。我也期待與各位建立真
  誠的連結，互相學習和成長。如果你有興趣了解更多關於我，或者想分享一些有趣的故事，請隨時與我聯繫
  。讓我們一起在這個數位世界中建立起美好的友誼吧！
  ''',
);

List<BackendUser> fakeOtherUserList = [
  BackendUser(
    id: '1',
    name: '艾咪',
    gender: 'F',
    introduction: '''
    嗨，大家好！我是艾咪，很高興能在這裡與你們見面。我是一個充滿熱情和創造力的人。我熱愛藝術
    和設計，喜歡用色彩和形狀來表達自己的想法和情感。藝術是我生活的一部分，它讓我感到自由和快樂。
    我也是一個旅行愛好者。我喜歡探索不同的地方，品味各地的美食和文化。旅行讓我擴大了視野，並且
    教會了我如何與人相處和尊重不同的價值觀。在工作方面，我是一個設計師。我熱衷於創作各種視覺和
    圖形設計，包括平面設計、品牌識別和網頁設計。我喜歡將想法轉化為視覺的形式，並創造出引人入勝
    的設計作品。我相信每一個人都擁有獨特的才華和價值，我希望能夠通過我的設計來展現這些特點並啟
    發他人。我追求創造出令人驚艷和有意義的設計，讓人們感到啟發和連結。除了工作，我喜歡與朋友一
    起度過美好的時光，分享笑聲和回憶。我也喜歡閱讀、寫作和欣賞音樂，這些活動讓我放鬆和平衡生活
    中的壓力。我很期待在這個平台上與大家交流和連結。如果你對設計、藝術或旅行有興趣，或者只是想
    聊天，請隨時與我聯繫！讓我們一起創造美麗的事物，共同成長和啟發吧！
    ''',
    hostActivities: [
      fakeActivityList[0],
      fakeActivityList[1],
      fakeActivityList[2]
    ],
    userBigPicLink: "https://picsum.photos/id/91/1000/500",
    userHeadShotLink: "https://picsum.photos/id/103/1000/500",
  ),
  BackendUser(
    id: '2',
    name: '鮑伯',
    gender: 'M',
    introduction: '''
    嘿，大家好！我是鮑伯，很高興能夠在這裡跟大家見面。
    我是一個樂觀開朗的人，總是帶著微笑面對生活。我相信每一天都是一個新的開始，充滿著機會和挑戰。
    我是一個熱愛運動的人。籃球是我最喜歡的運動，我享受在球場上盡情奔跑和投籃的感覺。
    除了籃球，我也喜歡打羽毛球、跑步和健身，保持健康的身體和活力對我來說很重要。
    在工作方面，我是一名市場營銷專業人士。我擁有豐富的營銷策略和品牌管理的經驗。
    我喜歡與團隊合作，找到創新的方法來推廣產品和服務，並與客戶建立長期的合作關係。
    除了工作，我喜歡與朋友和家人一起度過寶貴的時光。我喜歡在周末與朋友們聚會、
    享受美食和聆聽音樂。這些時刻讓我感到幸福和滿足。
    我很期待在這個平台上與大家交流和分享。如果你對市場營銷、運動或者只是想聊天，
    都歡迎隨時與我聯繫！讓我們一起創造美好的回憶和成就。
    ''',
  ),
  BackendUser(
    id: '3',
    name: '辛蒂',
    gender: 'F',
    introduction: '''嗨，大家好！我是辛蒂，很高興在這裡與你們相遇。我是一個充滿活力和正能量
    的人，總是樂於助人並享受與他人交流。我相信每個人都有自己獨特的價值和故事，我喜歡聆聽他人的
    故事，並與他們建立真誠的連結。我熱愛大自然和戶外活動。徜徉在自然的懷抱中，感受大地的氣息和
    風的撫摸，是我最喜愛的時刻。我喜歡去郊遊、徒步旅行和觀察自然景觀。這些經歷讓我感到平靜和與
    世界連結。在工作方面，我是一名心理學家。我對心理學的研究和應用充滿熱情，致力於幫助人們達到
    心理健康和幸福。我與個人和團體合作，提供心理諮詢和支持，幫助他們克服困難、發展潛能並提升生
    活質量。除了工作，我喜歡閱讀、寫作和瑜伽。閱讀讓我擴展知識和思考的範圍，寫作則是我表達自己
    和分享觀點的方式。瑜伽則讓我找到身心靈的平衡和和諧。我期待在這個平台上與你們建立真誠的連結
    ，分享我的經驗和知識，並從你們的故事中學習和成長。如果你對心理學、戶外活動或者只是想交朋友
    ，請隨時與我聯繫！讓我們一起創造一個支持和啟發彼此的社群。''',
  ),
  BackendUser(
    id: '4',
    name: '王小明',
    gender: 'M',
    introduction: '''
        大家好！我是王小明，很高興能夠在這裡向大家介紹自己。我是一個樂觀、積極的人，總是努
        力追求個人成長和學習新的事物。我相信每一個人都有無限的潛能，只要我們努力，就能實現自己
        的夢想。我對科技和創新充滿熱情。我喜歡探索最新的科技趨勢，並關注如何應用科技來改善我們
        的生活。我喜歡參與創業和科技社群，與志同道合的人交流和合作，共同推動創新的發展。除了科
        技，我也喜歡運動和健康生活。我喜歡跑步、打羽毛球和健身，這些活動讓我保持身體健康和精力
        充沛。我相信健康的身心狀態是成功的基礎。在學業方面，我是一個熱衷於知識探索的人。我擁有
        廣泛的知識背景，並持續學習和充實自己。我相信學習是一個終身的旅程，並且致力於不斷提升自
        己的技能和知識。我很期待在這個平台上與大家交流和分享。如果你對科技、創新或健康生活有興
        趣，或者只是想交朋友，請隨時與我聯繫！讓我們一起創造美好的未來，共同成長和繁榮。''',
  ),
  BackendUser(
    id: '5',
    name: '雪倫',
    gender: 'F',
    introduction: '''大家好！我是雪倫，很高興能夠在這裡向大家介紹自己。我是一個喜愛冒險和探索的人，對新
        事物充滿好奇心。我喜歡勇於嘗試不同的挑戰，並相信每一個經驗都是一次寶貴的學習機會。旅行
        是我最熱愛的活動之一。我喜歡探索世界各地的不同文化和風景，並與當地人交流和學習。這些旅
        行經驗豐富了我的視野，並讓我更加開放和包容。在工作方面，我是一名創意編輯。我熱愛文字和
        藝術，喜歡用文字和圖像來創造有意義和啟發性的內容。我享受挑戰自己的創造力，並將其應用於
        不同的媒體和領域。除了工作，我還喜歡閱讀、寫作和攝影。閱讀讓我深入思考和學習新知識，寫
        作則是我表達思想和情感的出口，攝影則是我記錄美好時刻和捕捉瞬間的方式。我希望在這個平台
        上能夠與大家分享我的經驗、知識和創意。如果你對旅行、創作或者只是想聊天，都歡迎隨時與我
        聯繫！讓我們一起探索世界，共同創造美好的故事和回憶。''',
  ),
];

List<Activity> fakeActivityList = [
  Activity(
      id: '1',
      title: '快樂游泳',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      description: '''
      歡迎參加「快樂游泳」活動，這是一個讓你享受水中樂趣、同時放鬆心情的精彩活動。
      無論你是游泳達人還是初學者，都能在這個活動中找到適合自己的樂趣。
      活動內容：
      1. 遊戲和競賽：我們將組織各種有趣的遊戲和競賽，讓參與者們在水中盡情娛樂。這包括游泳接力賽、水中籃球、水中排球等等。這些活動不僅能增加互動和競爭，還能提高參與者的游泳技巧和協作能力。
      2. 水中瑜伽和健身：在水中進行瑜伽和健身活動是一種非常有趣和挑戰性的體驗。參加者可以學習和實踐各種水中瑜伽動作，同時享受水的浮力和舒適感，這對身體的柔軟度和平衡能力都非常有益。
      3. 自由游泳和放鬆：除了參加組織活動，參與者還可以自由游泳，享受無拘束的水中自由。游泳不僅有助於增強心肺功能和肌肉力量，還能減輕壓力，提升心情。在游泳池中浸泡和漂浮，也能幫助身心放鬆，緩解壓力。
      4. 水中音樂會：我們將安排水中音樂會，為參與者提供一個獨特的音樂享受。在水中漂浮，同時聆聽著悅耳的音樂，這種經歷會帶來一種全新的感受和放鬆。
      活動備註：
      - 參加者需要具備基本的游泳能力。如果你是初學者或不太熟悉游泳，我們將提供專業的游泳教練指導和協助。
      - 活動場地會提供必要的安全措施，包括救生員和救生設備。
      - 請攜帶合適的游泳裝備，如泳衣、泳鏡、泳帽等。
      - 活動時間和場地將提前通知參加者。
      加入我們的「快樂游泳」活動，享受水中的樂趣和放鬆，與朋友和家人共度一個愉快的時光！''',
      host: BackendUser(
        id: '1',
        name: '艾咪',
        gender: 'F',
        introduction: '''
        嗨，大家好！我是艾咪，很高興能在這裡與你們見面。我是一個充滿熱情和創造力的人。我熱愛藝術
        和設計，喜歡用色彩和形狀來表達自己的想法和情感。藝術是我生活的一部分，它讓我感到自由和快樂。
        我也是一個旅行愛好者。我喜歡探索不同的地方，品味各地的美食和文化。旅行讓我擴大了視野，並且
        教會了我如何與人相處和尊重不同的價值觀。在工作方面，我是一個設計師。我熱衷於創作各種視覺和
        圖形設計，包括平面設計、品牌識別和網頁設計。我喜歡將想法轉化為視覺的形式，並創造出引人入勝
        的設計作品。我相信每一個人都擁有獨特的才華和價值，我希望能夠通過我的設計來展現這些特點並啟
        發他人。我追求創造出令人驚艷和有意義的設計，讓人們感到啟發和連結。除了工作，我喜歡與朋友一
        起度過美好的時光，分享笑聲和回憶。我也喜歡閱讀、寫作和欣賞音樂，這些活動讓我放鬆和平衡生活
        中的壓力。我很期待在這個平台上與大家交流和連結。如果你對設計、藝術或旅行有興趣，或者只是想
        聊天，請隨時與我聯繫！讓我們一起創造美麗的事物，共同成長和啟發吧！謝謝大家的支持與關注！
        ''',
        userBigPicLink: "https://picsum.photos/id/91/1000/500",
        userHeadShotLink: "https://picsum.photos/id/103/1000/500",
      ),
      backGroundLink: "https://picsum.photos/id/101/1000/500"),
  Activity(
      id: '2',
      title: '爬山趣',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      description: '''
      「爬山趣」是一個旨在鼓勵人們體驗大自然美景、挑戰自我的健康活動。無論你是經驗豐富的登山者還是初次嘗試，這個活動都將帶給你難忘的爬山體驗和愉快的時刻。
      活動內容：
      1. 登山路線選擇：我們將提供多條登山路線供參加者選擇，根據不同的能力和喜好，包括徒步步道和山脊攀登等。每條路線都有其獨特之處，讓你可以欣賞到壯麗的風景和自然美景。
      2. 團隊合作：在「爬山趣」中，你將有機會結識新朋友並參加團隊活動。我們將組織一些有趣的小遊戲和團隊挑戰，旨在促進合作和團結，同時增進彼此間的了解和互動。
      3. 自然解說：在登山過程中，我們將邀請專業的自然解說員陪同，向參加者講解山區的生態、植被和動物等知識。這將豐富你對大自然的認識，同時增加對保護環境的意識。
      4. 營火晚會：活動結束後，我們將舉辦一個營火晚會，讓參加者聚在一起分享他們的登山經驗和回憶。你可以與其他登山愛好者交流心得，同時享受溫暖的營火和美好的夜晚。
      活動備註：
      - 參加者需要具備基本的體力和健康狀態，並自行攜帶所需的登山裝備，如合適的鞋子、輕便背包、飲食和水源等。
      - 活動前將提供安全指導和登山技巧，確保參加者的安全。
      - 請攜帶相機或手機，以便捕捉美麗的登山風景。
      加入我們的「爬山趣」活動，與大自然接觸，挑戰自我，感受登山的樂趣和成就感。讓我們一起攀登高峰，創造難忘的回憶！
      ''',
      host: BackendUser(
        id: '1',
        name: '艾咪',
        gender: 'F',
        introduction: '''
        嗨，大家好！我是艾咪，很高興能在這裡與你們見面。我是一個充滿熱情和創造力的人。我熱愛藝術
        和設計，喜歡用色彩和形狀來表達自己的想法和情感。藝術是我生活的一部分，它讓我感到自由和快樂。
        我也是一個旅行愛好者。我喜歡探索不同的地方，品味各地的美食和文化。旅行讓我擴大了視野，並且
        教會了我如何與人相處和尊重不同的價值觀。在工作方面，我是一個設計師。我熱衷於創作各種視覺和
        圖形設計，包括平面設計、品牌識別和網頁設計。我喜歡將想法轉化為視覺的形式，並創造出引人入勝
        的設計作品。我相信每一個人都擁有獨特的才華和價值，我希望能夠通過我的設計來展現這些特點並啟
        發他人。我追求創造出令人驚艷和有意義的設計，讓人們感到啟發和連結。除了工作，我喜歡與朋友一
        起度過美好的時光，分享笑聲和回憶。我也喜歡閱讀、寫作和欣賞音樂，這些活動讓我放鬆和平衡生活
        中的壓力。我很期待在這個平台上與大家交流和連結。如果你對設計、藝術或旅行有興趣，或者只是想
        聊天，請隨時與我聯繫！讓我們一起創造美麗的事物，共同成長和啟發吧！謝謝大家的支持與關注！
        ''',
        userBigPicLink: "https://picsum.photos/id/91/1000/500",
        userHeadShotLink: "https://picsum.photos/id/103/1000/500",
      ),
      backGroundLink: "https://picsum.photos/id/102/1000/500"),
  Activity(
      id: '3',
      title: '探索麵包的魅力',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      description: '''
      活動介紹：
      「做麵包」活動是一個讓參加者親自參與製作麵包的互動體驗。無論你是一個烘焙初學者還是經驗豐富的廚藝愛好者，這個活動將帶給你探索麵包製作的樂趣和技巧。

      活動內容：
      1. 麵團製作：我們將提供專業的烘焙師傅指導，教授參加者如何製作麵團。你將學習到選擇合適的材料、配方比例和麵團發酵的技巧。這是一個動手操作的過程，讓你體驗到麵粉和水的變幻以及麵團的發展。

      2. 麵包造型：一旦麵團發酵完成，你將學習如何給麵團進行造型。我們將介紹各種造型技巧，如揉捏、卷捲和編織等，讓你創造出獨特的麵包形狀和圖案。這是展現創意和個人風格的機會。

      3. 烘焙與品嚐：完成造型後，麵包將進入烘焙的階段。專業的烘焙師傅將指導你掌握適當的烘焙時間和溫度，以確保麵包達到理想的口感和顏色。當麵包烘焙完成時，你將有機會品嚐自己親手製作的美味麵包。

      4. 麵包分享：在活動結束時，我們將舉辦一個麵包分享的時刻。參加者可以展示和分享他們的成品，品嚐彼此的麵包，並交流烘焙心得和技巧。這是一個互相啟發和激勵的機會，讓你從其他參加者中獲得新的靈感和想法。

      活動備註：
      - 活動場地將提供所需的烘焙設備和材料，參加者只需攜帶舒適的衣物和帶蓋

      容器帶回自己的麵包。
      - 活動中將提供烘焙師傅的專業指導和解答問題。
      - 活動時間和地點將提前通知參加者。

      加入我們的「做麵包」活動，展開一個美妙的烘焙之旅，發揮創意，品嚐自製麵包的美味！''',
      host: BackendUser(
        id: '1',
        name: '艾咪',
        gender: 'F',
        introduction: '''
        嗨，大家好！我是艾咪，很高興能在這裡與你們見面。我是一個充滿熱情和創造力的人。我熱愛藝術
        和設計，喜歡用色彩和形狀來表達自己的想法和情感。藝術是我生活的一部分，它讓我感到自由和快樂。
        我也是一個旅行愛好者。我喜歡探索不同的地方，品味各地的美食和文化。旅行讓我擴大了視野，並且
        教會了我如何與人相處和尊重不同的價值觀。在工作方面，我是一個設計師。我熱衷於創作各種視覺和
        圖形設計，包括平面設計、品牌識別和網頁設計。我喜歡將想法轉化為視覺的形式，並創造出引人入勝
        的設計作品。我相信每一個人都擁有獨特的才華和價值，我希望能夠通過我的設計來展現這些特點並啟
        發他人。我追求創造出令人驚艷和有意義的設計，讓人們感到啟發和連結。除了工作，我喜歡與朋友一
        起度過美好的時光，分享笑聲和回憶。我也喜歡閱讀、寫作和欣賞音樂，這些活動讓我放鬆和平衡生活
        中的壓力。我很期待在這個平台上與大家交流和連結。如果你對設計、藝術或旅行有興趣，或者只是想
        聊天，請隨時與我聯繫！讓我們一起創造美麗的事物，共同成長和啟發吧！謝謝大家的支持與關注！
        ''',
        userBigPicLink: "https://picsum.photos/id/91/1000/500",
        userHeadShotLink: "https://picsum.photos/id/103/1000/500",
      ),
      startDate: '2023-04-01',
      endDate: '2023-05-02',
      location: fakeLocationList[0]),
  Activity(
    id: '4',
    title: '狂熱搖滾之夜',
    categories: [fakeActivityCategoryList[1]],
    isLiked: false,
    isJoined: false,
    description: '''
    活動介紹：
    「狂熱搖滾之夜」是一個讓音樂愛好者沉浸在搖滾樂的熱情中的活動。這個活動將帶給你一個難忘的夜晚，充滿了現場音樂表演、搖滾文化和狂熱的氛圍。
    活動內容：
    1. 現場樂團表演：我們將邀請一支精彩的搖滾樂團現場演出，為你帶來高能量和令人興奮的音樂表演。這些樂團將演奏搖滾經典曲目和原創作品，讓你感受到搖滾樂的魅力和力量。
    2. 搖滾主題裝扮：活動中，你可以展現對搖滾文化的熱愛，盡情換上搖滾主題的裝扮。黑色皮革、樂團T恤、酷炫的配飾都是受歡迎的選擇。這是一個讓你與其他參加者互相展示個人風格和共同分享對搖滾的熱情的時刻。
    3. 樂團相互演出：除了主要樂團表演，我們也將提供一個平台，讓其他樂團和音樂人有機會進行短暫的現場演出。這是一個展示才華和交流音樂的機會，讓更多人能參與到音樂創作和演出中。
    4. 搖滾市集：活動場地將設置搖滾市集區域，展示各種與搖滾相關的商品和手工藝品。你可以找到獨特的樂團周邊產品、搖滾文化紀念品和音樂器材等。這是一個購物和交流的場所，讓你帶著一些特別的紀念品回家。
    活動備註：
    - 活動場地將提供舞台和音響設備，確保音樂表演的品質和效果。
    - 活動期間將提供飲料和小吃，以滿足參加者的需求。
    - 請攜帶身份證明文件，以確保年齡限制和入場要求。
    加入我們的「狂熱搖滾之夜」活動，與樂團和音樂愛好者一起揮灑搖滾的熱情，享受一個難忘的音樂之夜！''',
    host: BackendUser(
      id: '1',
      name: '艾咪',
      gender: 'F',
      introduction: '''
        嗨，大家好！我是艾咪，很高興能在這裡與你們見面。我是一個充滿熱情和創造力的人。我熱愛藝術
        和設計，喜歡用色彩和形狀來表達自己的想法和情感。藝術是我生活的一部分，它讓我感到自由和快樂。
        我也是一個旅行愛好者。我喜歡探索不同的地方，品味各地的美食和文化。旅行讓我擴大了視野，並且
        教會了我如何與人相處和尊重不同的價值觀。在工作方面，我是一個設計師。我熱衷於創作各種視覺和
        圖形設計，包括平面設計、品牌識別和網頁設計。我喜歡將想法轉化為視覺的形式，並創造出引人入勝
        的設計作品。我相信每一個人都擁有獨特的才華和價值，我希望能夠通過我的設計來展現這些特點並啟
        發他人。我追求創造出令人驚艷和有意義的設計，讓人們感到啟發和連結。除了工作，我喜歡與朋友一
        起度過美好的時光，分享笑聲和回憶。我也喜歡閱讀、寫作和欣賞音樂，這些活動讓我放鬆和平衡生活
        中的壓力。我很期待在這個平台上與大家交流和連結。如果你對設計、藝術或旅行有興趣，或者只是想
        聊天，請隨時與我聯繫！讓我們一起創造美麗的事物，共同成長和啟發吧！謝謝大家的支持與關注！
        ''',
      userBigPicLink: "https://picsum.photos/id/91/1000/500",
      userHeadShotLink: "https://picsum.photos/id/103/1000/500",
    ),
    startDate: '2023-02-01',
  ),
  Activity(
    id: '5',
    title: '冰上歡樂時光',
    categories: [fakeActivityCategoryList[0]],
    isLiked: false,
    isJoined: false,
    description: '''
    活動介紹：
    「溜冰」活動是一個讓你在冰上盡情遊玩和享受冬日樂趣的活動。不論你是冰上初學者還是熟練溜冰者，這個活動將帶給你歡樂、挑戰和社交的機會。
    活動內容：
    1. 冰上技巧練習：活動一開始，我們將提供專業教練指導，幫助初學者掌握基本的溜冰技巧，如保持平衡、前進和轉彎等。同時，熟練的溜冰者也可以在教練的指導下進一步提升技術，學習更高級的技巧和花式動作。
    2. 冰上遊戲和競賽：我們將組織各種有趣的冰上遊戲和競賽，增加活動的互動和樂趣。這包括冰上籃球、冰上接力賽、冰上曲棍球等等。這些活動既能增強團隊合作和協作能力，又能提升參與者的溜冰技巧和反應能力。
    3. 冰上表演和自由溜冰：在活動中，我們將安排冰上表演，邀請專業的溜冰選手展示精彩的冰上動作和花式表演。同時，參與者也可以享受自由溜冰的樂趣，在冰上自由滑行、優雅轉彎，盡情展現個人風采。
    4. 暖飲休憩區：在活動場地中，我們將設置舒適的暖飲休憩區，供參與者放鬆身心，享受熱飲和輕食。這是一個與朋友和家人聚集在一起、交流心得和回憶的場所。
    活動備註：
    - 活動場地將提供冰鞋租借服務，參加者無需事先準備冰鞋。
    - 請攜帶合適的冬季服裝和手套，以確保舒適和保暖。
    - 活動時間和地點將提前通知參加者。å
    ''',
    host: BackendUser(
      id: '1',
      name: '艾咪',
      gender: 'F',
      introduction: '''
        嗨，大家好！我是艾咪，很高興能在這裡與你們見面。我是一個充滿熱情和創造力的人。我熱愛藝術
        和設計，喜歡用色彩和形狀來表達自己的想法和情感。藝術是我生活的一部分，它讓我感到自由和快樂。
        我也是一個旅行愛好者。我喜歡探索不同的地方，品味各地的美食和文化。旅行讓我擴大了視野，並且
        教會了我如何與人相處和尊重不同的價值觀。在工作方面，我是一個設計師。我熱衷於創作各種視覺和
        圖形設計，包括平面設計、品牌識別和網頁設計。我喜歡將想法轉化為視覺的形式，並創造出引人入勝
        的設計作品。我相信每一個人都擁有獨特的才華和價值，我希望能夠通過我的設計來展現這些特點並啟
        發他人。我追求創造出令人驚艷和有意義的設計，讓人們感到啟發和連結。除了工作，我喜歡與朋友一
        起度過美好的時光，分享笑聲和回憶。我也喜歡閱讀、寫作和欣賞音樂，這些活動讓我放鬆和平衡生活
        中的壓力。我很期待在這個平台上與大家交流和連結。如果你對設計、藝術或旅行有興趣，或者只是想
        聊天，請隨時與我聯繫！讓我們一起創造美麗的事物，共同成長和啟發吧！謝謝大家的支持與關注！
        ''',
      userBigPicLink: "https://picsum.photos/id/91/1000/500",
      userHeadShotLink: "https://picsum.photos/id/103/1000/500",
    ),
    startDate: '2023-04-01',
    endDate: '2023-04-03',
  ),
  Activity(
      id: '6',
      title: 'Rocket Building',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-04-01',
      endDate: '2025-12-25',
      description:
          'Ahhhh! weee! Do you want to build a rocket and go to the moon?\n lalalalala Let\'s get started! weeeeeee~~~'),
  Activity(
      id: '7',
      title: 'sky diving',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[0],
      startDate: '2023-02-01',
      description: 'white bear is so cute'),
  Activity(
      id: '8',
      title: 'swimming',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-04-01',
      endDate: '2023-04-30',
      description: 'Weeeee! I love swimming'),
  Activity(
      id: '9',
      title: 'cutie pie',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      // host: fakeOtherUserList[1],
      startDate: '2023-10-01',
      endDate: '2028-12-25',
      description:
          'Ahhhh! is so cute! Do you want to build a rocket and go to the moon?\n lalalalala Let\'s get started! weeeeeee~~~'),
  Activity(
      id: '10',
      title: 'helicopter tour',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-02-01',
      description: 'white bear is so cute'),
  Activity(
      id: '11',
      title: 'Whitewater Rafting',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-05-15',
      description:
          'Experience the thrill of the rapids on this exciting whitewater rafting adventure. Navigate through the rushing waters and enjoy the stunning views along the way.'),
  Activity(
      id: '12',
      title: 'Hiking and Camping Trip',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-07-01',
      description:
          'Escape to the great outdoors and join us on a hiking and camping trip. Explore beautiful trails, set up camp, and enjoy the natural beauty of the wilderness.'),
  Activity(
      id: '13',
      title: 'Wine Tasting Tour',
      categories: [fakeActivityCategoryList[2]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-08-20',
      description:
          'Indulge in the finest wines on this exclusive wine tasting tour. Sample a variety of wines and learn about the history and production of each one.'),
  Activity(
      id: '14',
      title: 'Cooking Class',
      categories: [fakeActivityCategoryList[3]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-10-05',
      description:
          'Learn to cook like a pro on this fun and interactive cooking class. Discover new recipes and techniques, and enjoy a delicious meal at the end of the class.'),
  Activity(
      id: '15',
      title: 'Salsa Dancing Class',
      categories: [fakeActivityCategoryList[4]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-11-01',
      endDate: '2023-12-01',
      description:
          'Learn the basics of salsa dancing in this fun and interactive class.'),
  Activity(
      id: '16',
      title: 'Painting Class',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-05-30',
      description:
          'Learn the basics of painting in this fun and interactive class.'),
  Activity(
      id: '17',
      title: 'Yoga Class',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-08-30',
      description:
          'Learn the basics of yoga in this fun and interactive class.'),
  Activity(
      id: '18',
      title: 'Baking Class',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-10-01',
      endDate: '2024-03-30',
      description:
          'Learn the basics of baking in this fun and interactive class.'),
  Activity(
      id: '19',
      title: 'Skiing',
      categories: [fakeActivityCategoryList[0]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-08-30',
      description:
          'Learn the basics of skiing in this fun and interactive class.'),
  Activity(
      id: '20',
      title: 'Rock Climbing',
      categories: [fakeActivityCategoryList[1]],
      isLiked: false,
      isJoined: false,
      startDate: '2023-12-01',
      endDate: '2024-08-30',
      description:
          'Learn the basics of rock climbing in this fun and interactive class.'),
];

List<ChatRoom> fakeChatroomList = [
  ChatRoom(
    id: '1',
    heroRead: false,
    chatPartner: fakeOtherUserList[0],
    messages: [
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: false,
          content: '我也買了一些其他的東西，讚讚',
          time: '2021-05-01 12:22:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: '這次特價真的很划算',
          time: '2021-05-01 12:15:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: '好的，明天早上九點見！',
          time: '2021-05-01 12:13:00',
          type: "sent"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: 'And you?',
          time: '2021-05-01 12:12:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: '然後一起去那家店',
          time: '2021-05-01 12:11:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: '我們可以早上九點在商場集合',
          time: '2021-05-01 12:09:00',
          type: "sent"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: '太好了！當然想一起去，幾點出發呢？',
          time: '2021-05-01 12:06:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: '我找到了，有一家電子產品店明天有特價，你想一起去嗎？',
          time: '2021-05-01 12:05:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: '我想買一台新的手機，看看是否有優惠',
          time: '2021-05-01 12:03:00',
          type: "sent"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: '我可以查一下，你想買什麼？',
          time: '2021-05-01 12:02:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '1',
          heroRead: true,
          content: '我不確定',
          time: '2021-05-01 12:01:00',
          type: "received"),
      Message(
          chatroomID: '1',
          senderUserID: '0',
          heroRead: true,
          content: '嗨，你知道明天有沒有特價活動？',
          time: '2021-05-01 12:00:00',
          type: "sent"),
    ],
  ),
  ChatRoom(
    id: '2',
    heroRead: true,
    chatPartner: fakeOtherUserList[1],
    messages: [
      Message(
          chatroomID: '2',
          senderUserID: '2',
          heroRead: false,
          content: '或許可以改天吧，安排一個室內活動吧。',
          time: '2021-05-01 13:02',
          type: "received"),
      Message(
          chatroomID: '2',
          senderUserID: '0',
          heroRead: true,
          content: '真的嗎？我還計劃要出去郊遊呢。',
          time: '2021-05-01 13:01',
          type: "sent"),
      Message(
          chatroomID: '2',
          senderUserID: '2',
          heroRead: true,
          content: '你聽說了嗎？明天要下大雨。',
          time: '2021-05-01 13:00',
          type: "received"),
    ],
  ),
];
