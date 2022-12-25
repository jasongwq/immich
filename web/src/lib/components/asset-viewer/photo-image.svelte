<script lang="ts">
	import { fade } from 'svelte/transition';

	import { onMount } from 'svelte';

	export let assetId: string;
	export let assetData: string;
  export let assetInfo: AssetResponseDto;

	let canvasElement: HTMLCanvasElement;
	let imgElement: HTMLImageElement;
	

	onMount(() => {
			console.log("Canvas: mounted2");
			imgElement.onload=function (){
				// get canvas context
				let ctx = canvasElement.getContext("2d");
				canvasElement.width=imgElement.width
				canvasElement.height=imgElement.height
				console.log(imgElement.width);
				console.log(imgElement.height);
				let wightscale=imgElement.width/assetInfo.exifInfo.exifImageWidth
				let heightscale=imgElement.height/assetInfo.exifInfo.exifImageHeight
				console.log(wightscale);
				console.log(heightscale);
				ctx.drawImage(imgElement, 0, 0,imgElement.width,imgElement.height);
				ctx.fillStyle="#FF0000";
				
            const ocr_objs = JSON.parse(assetInfo.smartInfo.ocr_info);
            //Logger.log(`obj: ${ocr_objs}`);
    
            let fullstring=""
            ocr_objs.forEach((obj: Array<any>) => {
							// let x=obj[1][0][0]*wightscale
							// let y=obj[1][0][1]*heightscale
							// let width=(obj[1][1][0]-obj[1][0][0])*wightscale
							// let height=(obj[1][2][1]-obj[1][0][1])*heightscale
							// ctx.strokeRect(x,y,width,height);

						  ctx.beginPath();
							ctx.moveTo(obj[1][0][0]*wightscale, obj[1][0][1]*heightscale);
							ctx.lineTo(obj[1][1][0]*wightscale, obj[1][1][1]*heightscale);
							ctx.lineTo(obj[1][2][0]*wightscale, obj[1][2][1]*heightscale);
							ctx.lineTo(obj[1][3][0]*wightscale, obj[1][3][1]*heightscale);
							ctx.closePath(); //虽然我们只绘制了两条线段，但是closePath会closePath，仍然是一个3角形
							ctx.lineWidth = 5;
							ctx.strokeStyle = `rgb(255,0,0)`;
							ctx.stroke(); //描边。stroke不会自动closePath()

							console.log(`x: ${obj[1][0][0]},y: ${obj[1][0][1]}`);
            });


			}
		console.log("Canvas: mounted3");
	});

	type Point = [number, number];
	function drawLine(ctx: CanvasRenderingContext2D, start: Point, end: Point) {
			ctx.beginPath();
			ctx.moveTo(...start); // line will start here
			ctx.lineTo(...end); // line ends here
			ctx.stroke(); // draw it
	}

</script>
<canvas 
	transition:fade={{ duration: 150 }}
	class="object-contain h-full w-full transition-all"
	alt={assetId}
	bind:this={canvasElement}
/>
<img
	src={assetData}
	bind:this={imgElement}
	class="object-contain h-full transition-all"
	alt={assetId}
	loading="lazy"
	hidden=true
/>

