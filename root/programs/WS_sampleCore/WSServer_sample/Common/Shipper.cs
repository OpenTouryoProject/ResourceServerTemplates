//**********************************************************************************
//* フレームワーク・テストクラス（引数・戻り値）
//**********************************************************************************

// テスト用クラスなので、必要に応じて流用 or 削除して下さい。

//**********************************************************************************
//* クラス名        ：Shipper
//* クラス日本語名  ：Shipper Beanクラス
//*
//* 作成日時        ：－
//* 作成者          ：生技
//* 更新履歴        ：
//*
//*  日時        更新者            内容
//*  ----------  ----------------  -------------------------------------------------
//*  20xx/xx/xx  ＸＸ ＸＸ         ＸＸＸＸ
//**********************************************************************************

using Newtonsoft.Json;

namespace WSServer_sample.Common
{
    /// <summary>
    /// Shipper の概要の説明です
    /// </summary>
    public class Shipper
    {
        /// <summary>ShipperID</summary>
        [JsonProperty("shipperID")]
        public int ShipperID;

        /// <summary>CompanyName</summary>
        [JsonProperty("companyName")]
        public string CompanyName;

        /// <summary>Phone</summary>
        [JsonProperty("phone")]
        public string Phone;
    }
}