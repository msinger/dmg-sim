#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

static uint32_t read_timestamp()
{
	uint32_t r;
	int      c;
	c = getchar();
	if (c == EOF) exit(0);
	r = c & 0xff;
	c = getchar();
	if (c == EOF) exit(0);
	r |= (c & 0xff) << 8;
	c = getchar();
	if (c == EOF) exit(0);
	r |= (c & 0xff) << 16;
	c = getchar();
	if (c == EOF) exit(0);
	r |= (c & 0xff) << 24;
	return r;
}

static void put_pixel(FILE *f, int v, bool raw)
{
	const uint8_t pal_raw[5][3] = {
		{ 255, 255, 255 }, /* off */
		{ 252, 252, 252 }, /*  0  */
		{ 189, 189, 189 }, /*  1  */
		{ 126, 126, 126 }, /*  2  */
		{  63,  63,  63 }, /*  3  */
	};

	const uint8_t pal_classic[5][3] = {
		{ 229, 255,   0 }, /* off */
		{ 191, 245,   0 }, /*  0  */
		{ 139, 179,   0 }, /*  1  */
		{  99, 128,   0 }, /*  2  */
		{  62,  80,   0 }, /*  3  */
	};

	const uint8_t (*pal)[5][3];

	if (raw)
		pal = &pal_raw;
	else
		pal = &pal_classic;

	putc((*pal)[v][0], f);
	putc((*pal)[v][1], f);
	putc((*pal)[v][2], f);
}

int main(int argc, char **argv)
{
	uint8_t  frame0[160][144], frame1[160][144];
	uint8_t  (*bgframe)[160][144], (*fgframe)[160][144], (*tmpframe)[160][144];
	uint32_t t, pt, pidx;
	int      c, y;
	bool     dis, raw;

	bgframe = &frame0;
	fgframe = &frame1;
	memset(*bgframe, 0, sizeof *bgframe);
	memset(*fgframe, 0, sizeof *fgframe);
	dis  = false;
	y    = 0;
	pidx = 0;
	pt   = 0;
	raw  = false;

	if (argc > 1 && !strcmp(argv[1], "--raw"))
		raw = true;

	while (true) {
		t = read_timestamp();
		if (pt > t) {
			fprintf(stderr, "Timestamp going backwards\n");
			exit(1);
		}
		pt = t;
		while (pidx < t / 1024) {
			FILE *fp;
			char fname[256];
			sprintf(fname, "img%06u.rgb", pidx);
			fp = fopen(fname, "w");
			if (!fp) {
				fprintf(stderr, "Failed to open %s\n", fname);
				exit(1);
			}
			if (raw) {
				for (int i = 0; i < 144; i++)
					for (int j = 0; j < 160; j++)
						put_pixel(fp, (*fgframe)[j][i], true);
			} else {
				for (int i = 0; i < 144; i++) {
					for (int repeat = 0; repeat < 3; repeat++) {
						for (int j = 0; j < 160; j++) {
							put_pixel(fp, (*fgframe)[j][i], false);
							put_pixel(fp, (*fgframe)[j][i], false);
							put_pixel(fp, (*fgframe)[j][i], false);
							put_pixel(fp, 0, false);
						}
					}
					for (int j = 0; j < 160 * 4; j++)
						put_pixel(fp, 0, false);
				}
			}
			fclose(fp);
			pidx++;
		}
		c = getchar();
		if (c == EOF) exit(0);
		switch (c) {
		case 'V':
			tmpframe = bgframe;
			bgframe  = fgframe;
			fgframe  = tmpframe;
			memset(*bgframe, 0, sizeof *bgframe);
			y = 0;
			break;
		case 'D':
			if (dis) break;
			memset(*bgframe, 0, sizeof *bgframe);
			memset(*fgframe, 0, sizeof *fgframe);
			dis = true;
			break;
		case 'E':
			if (!dis) break;
			dis = false;
			break;
		case 'L':
		case 'l':
			if (dis)
				fprintf(stderr, "Line latched while disabled\n");
			if (y >= 144)
				fprintf(stderr, "Too many lines in frame %d\n", y);
			for (int i = 0; i < 160; i++) {
				if (!(i & 3)) {
					c = getchar();
					if (c == EOF) exit(0);
				}
				if (y < 144 && !dis)
					(*bgframe)[i][y] = ((c >> ((i & 3) * 2)) & 3) + 1;
			}
			y++;
			break;
		default:
			fprintf(stderr, "Unknown dataset %d\n", c);
			break;
		}
	}
}

