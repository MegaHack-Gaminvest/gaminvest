// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html";

// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss";

import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");

const hooks = {
  SavingsChart: {
    mounted() {
      const ctx = this.el.getContext("2d");
      const savings = JSON.parse(this.el.getAttribute("data-savings"));
      const projections = savings.map((point, i) => point * 0.024 * i + 1000);
      new Chart(ctx, {
        type: "line",
        data: {
          labels: [
            "2019",
            "2020",
            "2021",
            "2022",
            "2023",
            "2024",
            "2025",
            "2026",
            "2027",
            "2028",
          ],
          datasets: [
            {
              label: "Poupança",
              data: [...savings],
              fill: false,
              borderColor: "rgb(75, 192, 192)",
              lineTension: 0.1,
            },
            {
              label: "Gaminvest!",
              data: [...projections],
              fill: false,
              borderColor: "rgb(48, 48, 38)",
              lineTension: 0.1,
            },
          ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false
        },
      });
    }
  },
  HomeChart: {
    mounted() {
      const ctx = this.el.getContext("2d");
      const savings = JSON.parse(this.el.getAttribute("data-savings"));
      const projections = savings.map((point, i) => point * 0.024 * i + 1000);
      new Chart(ctx, {
        type: "line",
        data: {
          labels: [
            "2019",
            "2020",
            "2021",
            "2022",
            "2023",
            "2024",
            "2025",
            "2026",
            "2027",
            "2028",
          ],
          datasets: [
            {
              label: "Poupança",
              data: [...savings],
              fill: false,
              borderColor: "rgb(75, 192, 192)",
              lineTension: 0.1,
            },
            {
              label: "Gaminvest!",
              data: [...projections],
              fill: false,
              borderColor: "rgb(48, 48, 38)",
              lineTension: 0.1,
            },
          ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false
        },
      });
    },
  },
};

let liveSocket = new LiveSocket("/live", Socket, {
  hooks,
  params: { _csrf_token: csrfToken },
});

liveSocket.connect();
window.liveSocket = liveSocket;
