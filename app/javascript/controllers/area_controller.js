import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["prefArea","prefList"];

  connect() {
    // コントローラーが接続された時の処理
  }

  selectArea(event) {
    this.areaOverlayTarget.classList.remove("hidden");
    this.prefAreaTarget.classList.remove("hidden");
    const area = event.currentTarget.dataset.area;
  }

  selectPrefecture(event) {
  
    const id = event.target.dataset.id; // 正しいデータ属性の取得方法
    if (id) {
      document.querySelector('#q_prefecture_id_eq').value = id; // フォームの値を更新
      // リストの表示状態を切り替える
    this.prefListTargets.forEach(list => list.classList.toggle("hidden"));
    }
  }

  prefReset() {
    this.prefListTargets.forEach((el) => el.classList.add("hidden"));
    this.prefAreaTarget.classList.add("hidden");
  }

 
}

  //showPrefList(event) {
    //const area = this.data.get("area"); // Stimulusではthis.dataを使ってデータ属性を取得
    //const prefList = this.prefListTarget.querySelector(`[data-list="${area}"]`);
    //if (prefList) {
      //this.prefListTargets.forEach(list => list.classList.add("hidden"));
      //prefList.classList.remove("hidden");
    //}
  //}

  //selectPrefecture(event) {
    //const id = this.data.get("id"); // Stimulusではthis.dataを使ってデータ属性を取得
    //if (id) {
      //document.querySelector('#q_prefecture_id_eq').value = id;
      //this.prefListTargets.forEach(list => list.classList.add("hidden"));
    //}
  
