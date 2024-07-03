// only KANA   
document.querySelectorAll(".kana-input").forEach(function (input) {
        let isComposing = false;

        // compositionstart: 입력 시작 시 실행
        input.addEventListener("compositionstart", function (event) {
          isComposing = true;
        });
        // compositionend: 입력 종료 시 실행
        input.addEventListener("compositionend", function (event) {
          isComposing = false;
          const value = input.value;
          const katakanaRegex = /^[\u30A0-\u30FF]+$/; // 카타카나 범위

          if (!katakanaRegex.test(value)) {
            input.value = value.replace(/[^\u30A0-\u30FF]/g, "");
          }
        });

        input.addEventListener("input", function (event) {
          if (isComposing) {
            return; // 입력이 완료되기 전에는 아무 작업도 하지 않음
          }

          const value = input.value;
          const katakanaRegex = /^[\u30A0-\u30FF]*$/;

          if (!katakanaRegex.test(value)) {
            input.value = value.replace(/[^\u30A0-\u30FF]/g, "");
          }
        });
      });
      
// only Eng
    document.querySelectorAll('.eng-input').forEach(function(input) {
        let isComposing = false;

        // compositionstart 이벤트 리스너: 입력 시작 시 실행됨
        input.addEventListener('compositionstart', function(event) {
            isComposing = true;
        });

        // compositionend 이벤트 리스너: 입력 종료 시 실행됨
        input.addEventListener('compositionend', function(event) {
            isComposing = false;
            const value = input.value;
            const englishRegex = /^[a-zA-Z]*$/; // 영어 알파벳 범위 정규식

            if (!englishRegex.test(value)) {
                // 입력된 값이 영어 알파벳이 아닌 경우, 영어 알파벳 외의 모든 문자를 제거
                input.value = value.replace(/[^a-zA-Z]/g, '');
            }
        });

        // input 이벤트 리스너: 입력 중 발생하는 이벤트
        input.addEventListener('input', function(event) {
            if (isComposing) {
                return; // 입력이 완료되기 전에는 아무 작업도 하지 않음
            }

            const value = input.value;
            const englishRegex = /^[a-zA-Z]*$/; // 영어 알파벳 범위 정규식

            if (!englishRegex.test(value)) {
                // 입력된 값이 영어 알파벳이 아닌 경우, 영어 알파벳 외의 모든 문자를 제거
                input.value = value.replace(/[^a-zA-Z]/g, '');
            }
        });
    });
   